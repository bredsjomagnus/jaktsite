<template>
  <mdb-container>
       <div class="d-flex flex-row justify-content-around" style="margin-top:-20px">
            <mdb-card class='w-100' color="unique-color-dark">
                <mdb-card-text class="d-flex justify-content-center">Rapportens bilder</mdb-card-text>
            </mdb-card>
        </div>

        

       <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateU" :active="activeU" size="sm"> <mdb-icon icon="cloud-upload-alt"/> - Ladda upp</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateG" :active="activeG" size="sm"> <mdb-icon icon="images"/> - Bilder</mdb-btn>
                </mdb-btn-group>
                

            </div>
            <!-- </mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                 <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="backToKillreport_index" size="sm">Arkivet</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="backToKillreport" size="sm">Rapporten</mdb-btn>
                </mdb-btn-group>
            </div>

    <div v-if="activeG">
        <div>

            <div
                v-for="image in images"
                :key="image.id"
                class="mb-2"
            >

                <mdb-card class="w-100 p-0">
                    <mdb-view hover cascade>
                        <a href="#!" class="d-flex flex-row justify-content-center">
                            <mdb-card-image class="align-content-center" :src="imageurl(image)" alt="Card image cap" ></mdb-card-image>
                            <mdb-mask flex-center waves overlay="white-slight"></mdb-mask>
                        </a>
                    </mdb-view>
                    <mdb-card-body class="pb-0">
                         <mdb-card-footer :class="['w-100', 'text-muted', 'mt-1', {'display_footer_color': image.display == 'yes'}]">
                            <mdb-row>
                                <div class="w-100 d-flex flex-row justify-content-center">
                                    <mdb-btn color="mdb-color" @click.native="toggleImageDisplay(image)" :active="image.display == 'yes'" size="sm">
                                        <span v-if="image.display == 'yes'">
                                            <mdb-icon icon="eye"/> - Visas
                                        </span>
                                        <span v-if="image.display == 'no'">
                                            <mdb-icon icon="eye-slash" /> - Dold
                                        </span>
                                        </mdb-btn>
                                    <mdb-btn color="mdb-color" @click.native="rotateImage(image)" size="sm"><mdb-icon icon="redo-alt"/> - Rotera</mdb-btn>
                                </div>
                            </mdb-row>
                            
                        </mdb-card-footer>
                        <div class="w-100 pt-3 m-0 align-left info_field_bg">
                            <ul class="pl-3" style="list-style-type:none;">
                                <li class="text-muted" style="font-size: 12px;"><strong>Rapport #{{killreport.id}}, skapad {{killreport.created_at}}</strong></li>
                                <li class="text-muted" style="font-size: 12px;"><strong>Bild:</strong> {{image.name}}, {{image.filesize_readable}}</li>
                                <li class="text-muted" style="font-size: 12px;"><strong>Uppladdad av:</strong> {{username(image.user_id)}}</li>
                                <!-- <li class="text-muted" style="font-size: 12px;">Path: <strong>{{imageurl(image)}}</strong></li> -->
                            </ul>
                        </div>
                        
                       

                        <hr>

                        <div class="accordion accordion-wrapper " id="accordionExample275">
                                <div class="d-flex flex-row justify-content-center" id="headingOne" style="background-color: #f7f7f7; border-top: 3px solid #dccc9b;">
                                    <p class="mb-0">
                                        <a style="color: rgb(113 113 113);" class="accordion-btn" data-toggle="collapse" data-target="#collapseOne"
                                        aria-expanded="true" aria-controls="collapseOne2">
                                            Klicka här för att visa/dölja bildtext
                                        </a>
                                    </p>
                                </div>
                                <div id="collapseOne" class="collapse" aria-labelledby="headingOne"
                                    data-parent="#accordionExample275">
                                    <div>
                                         <mdb-input @change="onDescriptionChange()" type='textarea' label='Bildtext' v-model="image.description" :rows="5" />
                                        <mdb-btn class="w-100" :disabled="enable_update_description" color="mdb-color" @click.native="update_description(image)" size="sm"> Uppdatera bildtext </mdb-btn>
        
                                    </div>
                                </div>
                            
  
                        </div>
                       
                        
                       
                            <div v-if="authUser.role == 'admin' || authUser.id == image.user_id" class="mt-4 mb-2 w-100 text-center" style="background-color: rgb(247 247 247);">
                                <mdb-btn class="w-20" color="mdb-color" @click.native="deleteImage(image)" size="sm"><mdb-icon icon="trash-alt"/> - Ta bort bild </mdb-btn>
                            </div>
                       
                    </mdb-card-body>
                </mdb-card>
            </div>
         </div>
    </div>
    <div v-else-if="activeU">
         <div class="w-100">
            <div v-if="loading" class="spinner-border text-primary spinner-pos" role="status">
                    <span class="sr-only"></span>
            </div>
            <div v-if="loading" class="mt-5">
                <mdb-progress :height="20"  :value="progress" color="blue" />
            </div>
            <div v-else>
                
                <form>
                    <div>
                        <i class='text-muted' style="font-size:12px;">Bilder över 2 MB komprimeras.</i>
                    </div>
                
                    
                    <div class="d-flex flex-row justify-content-center mt-2">
                        <p :class="error ? 'error_message' : 'success_message'">{{message}}</p>
                    </div>
                <mdb-card>
                        <mdb-card-body class="cardborder">
                            <!-- <mdb-card-title></mdb-card-title> -->
                            <!-- <mdb-input type="text" class="w-100" label="Namn" v-model="upload_image.name" /> -->

                            <!-- <mdb-input v-if="authUser.role == 'admin'" type="number" label="dev user_id" v-model="dev_user_id" /> -->
                            <mdb-input type="textarea" class="w-100" label="Lägga till en bildtext?" v-model="upload_image.description" />
                        </mdb-card-body>
                    </mdb-card>
                    <mdb-card class="mt-2">
                        <mdb-card-body class="cardborder">
                            <div class="input-group">
                                <!-- <div class="input-group-prepend">
                                    <span class="input-group-text" id="inputGroupFileAddon01"></span>
                                </div> -->
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" @change="addImage()">
                                    <label class="custom-file-label" for="inputGroupFile01">{{this.file_input_name}}</label>
                                    
                                </div>
                        </div>
                        </mdb-card-body>
                    </mdb-card>
                    
                    <!-- <div class="d-flex flex-row justify-content-right mt-2">
                        <mdb-btn color="mdb-color" @click.native="addImage()" size="sm">Ladda upp</mdb-btn>
                    </div> -->
                </form>
             </div>
        </div>
    </div>
   
  </mdb-container>
</template>
<script>
	import { mdbProgress, mdbContainer, mdbBtn, mdbBtnGroup,mdbBtnToolbar, mdbIcon, mdbCard, mdbView, mdbCardBody, mdbCardTitle, mdbCardImage, mdbMask, mdbCardFooter, mdbInput, mdbRow } from 'mdbvue';
	export default {
		name: 'ImageEdit',
		components: {
            mdbContainer,
            mdbBtn,
            mdbBtnGroup,
            mdbBtnToolbar,
            mdbIcon,
            mdbCard,
            mdbView,
            mdbCardBody,
            mdbCardTitle,
            mdbCardImage,
            mdbMask,
            mdbCardFooter,
            mdbInput,
            mdbRow,
            mdbProgress
        },
        props: [
            "killreport",
            "authUser",
            "imageStoreUrl",
            "imageBaseUrl",
            "fileStoreUrl",
            "images",
            "storageBaseUrl",
            "killreportUrl",
            "users",
            "imageBaseUrl",
            "fileBaseUrl",
            "killreportIndexUrl"
        ],
        data() {
            return {
                upload_image: {
                    killreport_id: this.killreport.id,
                    user_id: this.authUser.id,
                    path: 'images/killreports',
                    name: '',
                    display: 'no',
                    description: null
                },
                message: '',
                error: false,
                activeG: true,
                activeU: false,
                images: this.images,
                file: null,
                file_input_name: '',
                dev_user_id: 2,
                enable_update_description: true,
                loading: false,
                progress: 0
                

            }
        },
        mounted() {
            console.log("mounted");
            console.log("this.killreport: ", this.killreport);
            console.log("this.authUser: ", this.authUser);
            console.log("this.imageStoreUrl: ", this.imageStoreUrl);
            console.log("this.imageBaseUrl: ", this.imageBaseUrl);
            console.log("this.fileStoreUrl: ", this.fileStoreUrl);
            console.log("this.images: ", this.images);
            console.log("this.storageBaseUrl: ", this.storageBaseUrl);
            console.log("this.killreportUrl: ", this.killreportUrl);
            console.log("this.users: ", this.users);
            console.log("this.imageBaseUrl: ", this.imageBaseUrl);
            console.log("this.fileBaseUrl: ", this.fileBaseUrl);
            console.log("this.killreportIndexUrl: ", this.killreportIndexUrl);

            if(this.images.length == 0) {
                // Har rapporten inga bilder skall första bilden sättas som display
                // och man skall direkt landa på ladda upp vyn
                this.upload_image.display = 'yes';
                this.activeG = false;
                this.activeU = true;
            }
            
        },
		methods: {
            onDescriptionChange(event) {
                console.log("onDescriptionChange");
                this.enable_update_description = false;
            },
            update_description(image) {
                let imageUpdateUrl = this.imageBaseUrl+'/'+image.id+'/update';
                axios.patch(imageUpdateUrl, image)
                    .then(response => {
                        console.log("Image description updated");
                        this.enable_update_description = true;
                    })
                    .catch(error => {
                        console.log("update image description error: ", error);
                    });
                
                
            },
            toggleImageDisplay(image) {
                if(image.display == 'yes') {
                    image.display = 'no';
                } else {
                    image.display = 'yes';
                }

                console.log("AFTER TOGGLE image: ", image);
                console.log("AFTER TOGGLE this.images: ", this.images);

                let display_images = this.images.filter(obj => {
                    return obj.display == 'yes';
                });

                console.log(display_images)

                display_images.forEach(obj => {
                    if(obj.id != image.id) {
                        obj.display = 'no';
                        this.updateImage(obj);
                    }

                });

                this.updateImage(image);
            },
            updateImage(image) {
                 let imageUpdateUrl = this.imageBaseUrl+'/'+image.id+'/update';

                axios.patch(imageUpdateUrl, image)
                    .then(response => {
                        console.log('updated image');
                    })
                    .catch(error => {
                        console.log("update image error: ", error);
                    });
            },
            deleteImage(image) {
                if( confirm('Vill du ta bort bilden?')) {
                    let imageDeleteUrl = this.imageBaseUrl+'/'+image.id+'/delete';
                    let fileDeleteUrl = this.fileBaseUrl+'/'+image.id+'/delete';
                    let image_storage_path = this.imageurl(image);
                    console.log("deleting image: ", image_storage_path);
                    axios.delete(fileDeleteUrl, image)
                        .then(response => {
                            console.log("deleting file");
                            console.log('file-delete-message: ', response.data.message);
                            axios.delete(imageDeleteUrl, image)
                                .then(response => {
                                    console.log("delete image message: ", response.data.message);
                                    window.location.reload();
                                })
                                .catch(error => {
                                    console.log("image delete error: ", error);  
                                });
                        })
                        .catch(error => {
                            console.log("file delete error: ", error);
                        }); 
                }
                


               
            },
            rotateImage(image) {
                let fileRotateUrl = this.fileBaseUrl+'/'+image.id+'/rotate';
                axios.patch(fileRotateUrl, image)
                    .then(response => {
                        console.log("rotate image");
                        console.log('file-rotate-message: ', response.data.message);
                        window.location.reload();
                    })
                    .catch(error => {
                        console.log("file rotate error: ", error);
                    });

            },
            username(id) {
                console.log("USERNAME->id: ", id);
                let user = this.users.filter(obj => {
                    return obj.id === id;
                });

                console.log("user: ", user);

                return user[0].firstname + " " + user[0].lastname;
            },
            imageurl(image) {
                // lägger till datestamp för att inte uppdateringarna skall hänga sig i cache. Då ser webbläsaren bilden som ny varje gång.
                const datestamp = Date.now();
                let url = this.storageBaseUrl+"/k"+this.killreport.id+"_i"+image.id+"_u"+image.user_id+"_"+image.name;
                console.log("imageurl: ", url+"?"+datestamp);
                return url+"?"+datestamp;
            },
            toggleActiveStateG() {
                this.activeG = true;
                this.activeU = false;
            },
            toggleActiveStateU() {
                this.activeG = false;
                this.activeU = true;
            },
            backToKillreport() {
                window.location = this.killreportUrl;
            },
            backToKillreport_index() {
                window.location = this.killreportIndexUrl;
            },
            onFileChanged() {
                /*
                    Kontrollerar att det bara är en fil som skickas och att den är tillåten (image/png,jpg,jpeg)
                */
               event.preventDefault();

               //återställer ett eventuellt felmeddelnade
               this.message = '';
               this.error = false;

                // Kontrollera att det bara är en fil
                if(event.target.files.length == 1) {
                    
                    // filen; file.name, file.type, file.size, file.lastModified, file.lastModifiedDate
                    this.file = event.target.files[0];
                    console.log("file: ", this.file);

                    // ex filetype = ['image', 'png']
                    let filetype = this.file.type.split('/'); 

                    // innehåller arrayen filetype nu två element
                    if(filetype.length == 2) {

                        // Kollar så att filen är en bild med tillåtet format; png, jpg, jpeg
                        if( (filetype[0] === 'image' && (filetype[1].toLowerCase() === 'png' || filetype[1].toLowerCase() === 'jpg' || filetype[1].toLowerCase() === 'jpeg')) ) {
                            console.log("Tillåten fil");

                            // this.upload_image.name = this.file.name.split('.')[0];
                            this.file_input_name = this.file.name;
                            
                        }
                    }
                }
            },
			addImage() {
                // lägger till formatet innan jag laddar upp bilden till databasen
                // let firstpart_name = this.upload_image.name;
                // this.upload_image.name = this.upload_image.name + "." + this.file.name.split('.')[1];

                 /*
                    Kontrollerar att det bara är en fil som skickas och att den är tillåten (image/png,jpg,jpeg)
                */
               event.preventDefault();

               this.loading = true;
               this.progress = 0;

               //återställer ett eventuellt felmeddelnade
               this.message = '';
               this.error = false;

                // Kontrollera att det bara är en fil
                if(event.target.files.length == 1) {
                    
                    // filen; file.name, file.type, file.size, file.lastModified, file.lastModifiedDate
                    this.file = event.target.files[0];
                    console.log("file: ", this.file);

                    // ex filetype = ['image', 'png']
                    let filetype = this.file.type.split('/'); 

                    // innehåller arrayen filetype nu två element
                    if(filetype.length == 2) {

                        // Kollar så att filen är en bild med tillåtet format; png, jpg, jpeg
                        if( (filetype[0] === 'image' && (filetype[1].toLowerCase() === 'png' || filetype[1].toLowerCase() === 'jpg' || filetype[1].toLowerCase() === 'jpeg')) ) {
                            console.log("Tillåten fil");
                            this.progress = 10;

                            // this.upload_image.name = this.file.name.split('.')[0];
                            this.file_input_name = this.file.name;

                            this.upload_image.name = this.file.name;

                            // if(this.upload_image.description == null){
                            //     this.upload_image.description = '-';
                            // }

                            console.log("dev_user_id: ", this.dev_user_id);
                            console.log("dev_user_id type: ", typeof this.dev_user_id);

                            // this.upload_image.user_id = this.dev_user_id;

                            console.log("this.upload_image: ", this.upload_image);
                            
                            // lägger till rad om bild i databasen
                            axios.post(this.imageStoreUrl, this.upload_image)
                                .then(response => {
                                    if( response.data.worked ) {
                                        console.log("image med id "+ response.data.image_id +" tillagd i databasen")

                                        let image_id = response.data.image_id;
                                        this.progress = 80;

                                        // header config för formdata
                                        const config = {
                                            header: { 'content-type': 'multipart/form-data'}
                                        }

                                        // instansierar formdata
                                        let formdata = new FormData();



                                        // filename
                                        // let filename = "k"+this.killreport.id+"_i"+image_id+ "_u"+this.authUser.id+"_" +this.file.name.split('.')[0]+"."+this.file.name.split('.')[1];
                                        
                                        // filename - dev
                                        let filename = "k"+this.killreport.id+"_i"+image_id+ "_u"+this.upload_image.user_id+"_" +this.file.name.split('.')[0]+"."+this.file.name.split('.')[1];
                                        console.log("filename: ", filename);

                                        // appendar data
                                        formdata.append('file', this.file, filename);

                                        // skickar bilden till servern för att sparas på disk
                                        axios.post(this.fileStoreUrl, formdata, config)
                                            .then(response => {
                                                console.log("FileController response.data.message: ", response.data.message);
                                                this.progress = 90;
                                                // om inte filen kunde sparas på disk måste den nyligen databassparade image tas bort.
                                                if( response.data.message == 'failure') {
                                                    // let filesize = Math.round((this.file.size/1000000*10))/10;
                                                    // this.message = this.file.name +" kunde inte laddas upp till servern? Filesize: "+filesize +" Mb";
                                                    // this.error = true

                                                    

                                                    // endpoint för att ta bort bilderna
                                                    let imageDeleteUrl = this.imageBaseUrl+'/'+image_id+'/delete';

                                                    // ta bort bilden med id image_id
                                                    axios.delete(imageDeleteUrl, image_id)
                                                        .then(response => {
                                                            console.log("delete image response: " ,response.data.message);
                                                            this.loading = false;
                                                        })
                                                        .catch(error => {
                                                            console.log("delete image error: ", error)
                                                            this.loading = false;
                                                        })
                                                } else {
                                                    this.progress = 100;
                                                    this.message = this.file.name +" uppladdad!";
                                                    this.toggleActiveStateG();
                                                    window.location.reload();
                                                }

                                                

                                                        })
                                                        .catch(error => {
                                                            console.log("file store: ", error);
                                                        })
                                                }
                                            })
                                            .catch(error => {
                                                console.log("store image error: ", error);
                                            });
                        }
                    }
                } else {
                    this.message = "Kan bara lägga till en bild i taget!";
                }

                

                        


                // axios.post(imageCreateUrl, this.image)
                //     .then(response => {
                //         console.log("addImage success: image = ", this.image);
                //     })
                //     .catch(error => {
                //         console.log("addImage Error: ", error);
                //     })
				
			}
		}
	}
</script>
<style scope>
.error_message {
    color: red;
}
.success_message {
    color: green;
}
.info_field_bg {
    background-color: #F7F7F7;
    border-bottom: 1px solid #D8D8D8;
}
.display_footer_color {
    background-color: #e9efe4;
}
.cardborder {
    border-left: 10px solid #59698d;
}
.spinner-pos {
    margin-top: 40%;
    margin-left: 45%;
}
.accordion-btn {
    font-size: 10px;
    padding: 0;
}
.accordion-wrapper {
    margin-top: -20px;
    padding: 0;
    border-top: 1px solid #F7F7F7;
    border-bottom: 1px solid #F7F7F7;
}
</style>