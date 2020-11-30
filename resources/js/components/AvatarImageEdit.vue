<template>
  <mdb-container>
       <div class="d-flex flex-row justify-content-around" style="margin-top:-20px">
            <mdb-card class='w-100' color="unique-color-dark">
                <mdb-card-text class="d-flex justify-content-center">Ändra profilbild</mdb-card-text>
            </mdb-card>
        </div>

        

       <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="backToUserShow" size="sm"><mdb-icon icon="user"/></mdb-btn>
                    <mdb-btn :disabled="avatar" color="mdb-color" @click.native="toggleActiveStateU" :active="activeU" size="sm"> <mdb-icon icon="cloud-upload-alt"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateG" :active="activeG" size="sm"> <mdb-icon icon="user-circle"/></mdb-btn>
                </mdb-btn-group>
                

            </div>
            

    <div v-if="activeG">
        <div>

            <div
                v-if="avatar"
            >

                <mdb-card class="w-100 p-0">
                    <mdb-view hover cascade>
                        <a href="#!" class="d-flex flex-row justify-content-center">
                            <mdb-card-image class="align-content-center" :src="avatarurl(avatar)" alt="Avatar image" ></mdb-card-image>
                            <mdb-mask flex-center waves overlay="white-slight"></mdb-mask>
                        </a>
                    </mdb-view>
                    <mdb-card-body class="pb-0">
                         <mdb-card-footer>
                            <mdb-row>
                                <div class="w-100 d-flex flex-row justify-content-around">
                                    <div v-if="authUser.role == 'admin' || authUser.id == avatar.user_id">
                                        <mdb-btn class="w-20" color="mdb-color" @click.native="deleteAvatar(avatar)" size="sm"><mdb-icon icon="trash-alt"/></mdb-btn>
                                    </div>
                                    <mdb-btn color="mdb-color" @click.native="rotateAvatar(avatar)" size="sm"><mdb-icon icon="redo-alt"/></mdb-btn>
                                </div>
                            </mdb-row>
                            
                        </mdb-card-footer>
                                 
                    </mdb-card-body>
                </mdb-card>
            </div>
            <div v-else>
                <p class="mt-2" style="font-size: 12px;">Ingen avatar uppladdad än. Har man kopplat sitt konto till Gravatar så kommer den avataren att anävändas som backup.</p>
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
                    <mdb-card class="mt-2">
                        <mdb-card-body class="cardborder">
                            <div class="input-group">
    
                                <div class="custom-file">
                                    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" @change="addAvatar()">
                                    <label class="custom-file-label" for="inputGroupFile01">{{this.file_input_name}}</label>
                                    
                                </div>
                        </div>
                        </mdb-card-body>
                    </mdb-card>

                </form>
             </div>
        </div>
    </div>
   
  </mdb-container>
</template>
<script>
	import { mdbProgress, mdbContainer, mdbBtn, mdbBtnGroup,mdbBtnToolbar, mdbIcon, mdbCard, mdbView, mdbCardBody, mdbCardTitle, mdbCardImage, mdbCardText, mdbMask, mdbCardFooter, mdbInput, mdbRow } from 'mdbvue';
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
            mdbCardText,
            mdbMask,
            mdbCardFooter,
            mdbInput,
            mdbRow,
            mdbProgress
        },
        props: [
            "authUser",
            'avatar',
            "avatarBaseUrl",
            "fileBaseUrl",
            "storageBaseUrl",
            "userShowUrl"
        ],
        data() {
            return {
                upload_avatar: {
                    user_id: this.authUser.id,
                    path: 'images/avatars',
                    name: '',
                    display: 'no',
                    description: null
                },
                message: '',
                error: false,
                activeG: true,
                activeU: false,
                file: null,
                file_input_name: '',
                enable_update_description: true,
                loading: false,
                progress: 0
                

            }
        },
        mounted() {
            console.log("mounted");
            console.log("authUser: ", this.authUser);
            console.log("avatarBaseUrl: ", this.avatarBaseUrl);
            console.log("fileBaseUrl: ", this.fileBaseUrl);
            console.log("storageBaseUrl: ", this.storageBaseUrl);
            console.log("avatar: ", this.avatar);
            console.log("userShowUrl: ", this.userShowUrl);

            if(!this.avatar) {
                this.activeG = false;
                this.activeU = true;
            }
           
            
        },
		methods: {
            updateImage(image) {
                 let avatarUpdateUrl = this.avatarBaseUrl+'/'+image.id+'/update';

                axios.patch(avatarUpdateUrl, avatar)
                    .then(response => {
                        console.log('updated avatar');
                    })
                    .catch(error => {
                        console.log("update avatar error: ", error);
                    });
            },
            deleteAvatar(avatar) {
                if( confirm('Vill du ta bort bilden?')) {
                    let avatarDeleteUrl = this.avatarBaseUrl+'/'+avatar.id+'/delete';
                    let fileDeleteUrl = this.fileBaseUrl+'/'+avatar.id+'/delete';
                    let avatar_storage_path = this.avatarurl(avatar);
                    console.log("deleting image: ", avatar_storage_path);
                    axios.delete(fileDeleteUrl, avatar)
                        .then(response => {
                            console.log("deleting file");
                            console.log('file-delete-message: ', response.data.message);
                            axios.delete(avatarDeleteUrl, avatar)
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
            rotateAvatar(avatar) {
                let fileRotateUrl = this.fileBaseUrl+'/'+avatar.id+'/rotate';
                axios.patch(fileRotateUrl, avatar)
                    .then(response => {
                        console.log("rotate avatar");
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
            avatarurl(avatar) {
                // lägger till datestamp för att inte uppdateringarna skall hänga sig i cache. Då ser webbläsaren bilden som ny varje gång.
                const datestamp = Date.now();
                let url = this.storageBaseUrl+"/i"+avatar.id+"_u"+avatar.user_id+"_"+avatar.name;
                console.log("avatarurl: ", url+"?"+datestamp);
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
            backToUserShow() {
                window.location = this.userShowUrl;
            },
			addAvatar() {
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

                            // this.upload_avatar.name = this.file.name.split('.')[0];
                            this.file_input_name = this.file.name;

                            this.upload_avatar.name = this.file.name;

                            // if(this.upload_avatar.description == null){
                            //     this.upload_avatar.description = '-';
                            // }

                            console.log("dev_user_id: ", this.dev_user_id);
                            console.log("dev_user_id type: ", typeof this.dev_user_id);

                            // this.upload_image.user_id = this.dev_user_id;

                            console.log("this.upload_avatar: ", this.upload_avatar);
                            
                            // lägger till rad om bild i databasen
                            axios.post(this.avatarBaseUrl+"/store", this.upload_avatar)
                                .then(response => {
                                    if( response.data.worked ) {
                                        console.log("avatar med id "+ response.data.image_id +" tillagd i databasen")

                                        let avatar_id = response.data.avatar_id;
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
                                        let filename = "i"+avatar_id+ "_u"+this.upload_avatar.user_id+"_" +this.file.name.split('.')[0]+"."+this.file.name.split('.')[1];
                                        console.log("filename: ", filename);

                                        // appendar data
                                        formdata.append('file', this.file, filename);

                                        // skickar bilden till servern för att sparas på disk
                                        axios.post(this.fileBaseUrl+"/store", formdata, config)
                                            .then(response => {
                                                console.log("FileController response.data.message: ", response.data.message);
                                                this.progress = 90;

                                                // om inte filen kunde sparas på disk måste den nyligen databassparade avataren tas bort.
                                                if( response.data.message == 'failure') {
                     
                                                    // endpoint för att ta bort bilderna
                                                    let avatarDeleteUrl = this.avatarBaseUrl+'/'+avatar_id+'/delete';

                                                    // ta bort bilden med id avatar_id
                                                    axios.delete(avatarDeleteUrl, avatar_id)
                                                        .then(response => {
                                                            console.log("delete avatar response: " ,response.data.message);
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
                                                    // window.location.reload();
                                                    window.location = this.userShowUrl;
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