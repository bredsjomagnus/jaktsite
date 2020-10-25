<template>
  <mdb-container>

    <div class="w-100">
        <form>
            <div>
                <span>Max storlek 3 Mb</span>
            </div>
            <div class="input-group">
                <div class="input-group-prepend">
                    <span class="input-group-text" id="inputGroupFileAddon01">Bild</span>
                </div>
                <div class="custom-file">
                    <input type="file" class="custom-file-input" id="inputGroupFile01" aria-describedby="inputGroupFileAddon01" @change="addImage">
                    <label class="custom-file-label" for="inputGroupFile01">...</label>
                </div>
            </div>
            <div class="d-flex flex-row justify-content-center mt-2">
                <p :class="error ? 'error_message' : 'success_message'">{{message}}</p>
            </div>
        </form>
    </div>
  </mdb-container>
</template>
<script>
	import { mdbContainer } from 'mdbvue';
	export default {
		name: 'ImageEdit',
		components: {
			mdbContainer
        },
        props: [
            "killreport",
            "authUser",
            "imageStoreUrl",
            "imageBaseUrl",
            "fileStoreUrl"
        ],
        data() {
            return {
                image: {
                    killreport_id: this.killreport.id,
                    user_id: this.authUser.id,
                    path: 'images/killreports',
                    name: 'name',
                    display: 'no',
                },
                message: '',
                error: false

            }
        },
        mounted() {
            console.log("mounted");
            console.log("this.killreport: ", this.killreport);
            console.log("this.authUser: ", this.authUser);
            console.log("this.imageStoreUrl: ", this.imageStoreUrl);
            console.log("this.imageBaseUrl: ", this.imageBaseUrl);
            console.log("this.fileStoreUrl: ", this.fileStoreUrl);
            

        },
		methods: {
			addImage(event) {
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
                    let file = event.target.files[0];
                    console.log("file: ", file);

                    // ex filetype = ['image', 'png']
                    let filetype = file.type.split('/'); 

                    // innehåller arrayen filetype nu två element
                    if(filetype.length == 2) {

                        // Kollar så att filen är en bild med tillåtet format; png, jpg, jpeg
                        if( (filetype[0] === 'image' && (filetype[1].toLowerCase() === 'png' || filetype[1].toLowerCase() === 'jpg' || filetype[1].toLowerCase() === 'jpeg')) ) {
                            console.log("Tillåten fil");
                            
                            this.image.name = file.name;

                            // lägger till rad om bild i databasen
                            axios.post(this.imageStoreUrl, this.image)
                                .then(response => {
                                    
                                    
                                    if( response.data.worked ) {
                                        console.log("image med id "+ response.data.image_id +" tillagd i databasen")

                                        let image_id = response.data.image_id;

                                        // header config för formdata
                                        const config = {
                                            header: { 'content-type': 'multipart/form-data'}
                                        }

                                        // instansierar formdata
                                        let formdata = new FormData();

                                        // filename
                                        let filename = "k"+this.killreport.id+"_i"+image_id+ "_u"+this.authUser.id+"_" +file.name.split('.')[0] + "." + filetype[1];
                                        console.log("filename: ", filename);

                                        // appendar data
                                        formdata.append('file', file, filename);

                                        // skickar bilden till servern för att sparas på disk
                                        axios.post(this.fileStoreUrl, formdata, config)
                                            .then(response => {
                                                console.log("FileController response.data.message: ", response.data.message);

                                                // om inte filen kunde sparas på disk måste den nyligen databassparade image tas bort.
                                                if( response.data.message == 'failure') {
                                                    let filesize = Math.round((file.size/1000000*10))/10;
                                                    this.message = file.name +" kunde inte laddas upp till servern? Filesize: "+filesize +" Mb";
                                                    this.error = true

                                                    // endpoint för att ta bort bilderna
                                                    let imageDeleteUrl = this.imageBaseUrl+'/'+image_id+'/delete';

                                                    // ta bort bilden med id image_id
                                                    axios.delete(imageDeleteUrl, image_id)
                                                        .then(response => {
                                                            console.log("delete image response: " ,response.data.message);
                                                        })
                                                        .catch(error => {
                                                            console.log("delete image error: ", error)
                                                        })
                                                } else {
                                                    this.message = file.name +" uppladdad!";
                                                }

                                                

                                            })
                                            .catch(error => {
                                                console.log("file store: ", error);
                                            })
                                    }
                                })
                                .catch(error => {
                                    console.log("store image error: ", error);
                                })

                        } else {
                            console.log("Otillåten fil");
                        }
                    } else {
                        console.log("filetype.length är inte två")
                    }
                } else {
                    console.log("Fler än en fil");
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
<style>
.error_message {
    color: red;
}
.success_message {
    color: green;
}
</style>