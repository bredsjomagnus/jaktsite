<template>
<mdb-card>
    <div class="d-flex justify-content-center" style="display:block; background-color: rgb(20, 40, 55); height: 40px;">
		<div class="align-middle pt-2">
      		<p style="color:white">REGISTRERA NY ANVÄNDARE</p>
		</div>
	</div>
    <mdb-card-body class="infopart">
  <!-- Material form create user -->
  <!-- @submit.prevent="submitForm" -->
  	<form @submit.prevent="submitForm" class="formpart">
			<mdb-input label="Användarnamn" v-model="fields.username" />
			<mdb-input label="Email" type="email" v-model="fields.email" />
			<mdb-input label="Förnamn" v-model="fields.firstname" />
			<mdb-input label="Efternamn" v-model="fields.lastname" />
			<mdb-input label="Lösenord" type="password" v-model="fields.password" />
			<input type="hidden" name="_token" :value="csrf">
			<div class="text-center">
				<mdb-btn color="mdb-color" type="submit"><mdb-icon icon="user-plus" class="ml-1"/> - Skapa</mdb-btn>
			</div>

		</form>
  <!-- Material form create user -->
      </mdb-card-body>
  </mdb-card>
</template>
<script>
  import axios from "axios";
  import { mdbInput, mdbBtn, mdbIcon, mdbCard, mdbCardBody } from 'mdbvue';
  export default {
    name: 'Basic',
    components: {
      mdbInput,
      mdbBtn,
      mdbIcon,
      mdbCard,
      mdbCardBody
    },
    props: [
      'storeUrl',
      'createUrl'
    ],
    data() {
        return {
          csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
          fields: {
            username: "",
            email: "",
            password: "",
            firstname: "",
            lastname: "",
            role: "user",
            active: "yes",
            occupation: "hunter"
          }
        }
    },
    mounted(){
      console.log(this.storeUrl);
      console.log(this.createUrl);
    },
    methods: {
      submitForm(event) {
        console.log("storeUrl:");
        console.log(this.storeUrl);
          axios
            .post('http://localhost/pwww/jaktsite/public/user/store', this.fields)
            .then(response => {
              this.fields = {};
              // window.location = response.request.responseURL;
              console.log("KOMMER HIT")
              // window.location = 'http://localhost/pwww/jaktsite/public/user/create';
            })
            .catch(error => {
              console.log(error);
            });
      }
    }
    
  }
</script>
<style scoped>
.infopart {
	margin-top: -25px;
}
.formpart {
  padding-left: 10px;
}
</style>  