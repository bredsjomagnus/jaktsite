<template>
  <!-- Material form login -->
  <!-- @submit.prevent="submitForm" -->
  <form @submit.prevent="submitForm">
    <p class="h4 text-center mb-4">Logga in</p>
    <div class="grey-text">
      <mdb-input label="Användarnamn" icon="user" v-model="fields.username" type="text"/>
      <mdb-input label="Lösenord" icon="lock" v-model="fields.password" type="password"/>
    </div>
    <div>
      <a href="http://localhost/pwww/jaktsite/public/password">Glömt lösenordet?</a>
    </div>
    <div class="text-center">
      <mdb-btn color="mdb-color" type="submit"><mdb-icon icon="sign-in-alt" class="ml-1"/> - Logga in</mdb-btn>
    </div>
    <input type="hidden" name="_token" :value="csrf">
  </form>
  <!-- Material form login -->
</template>
<script>
  import axios from "axios";
  import { mdbInput, mdbBtn, mdbIcon } from 'mdbvue';
  export default {
    name: 'Basic',
    components: {
      mdbInput,
      mdbBtn,
      mdbIcon
    },
    props:[
      'postUrl'
    ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            fields: {
              username: "",
              password: ""
            },
            log: {
              path: window.location.pathname
            }
        }
    },
    mounted() {
      console.log(this.postUrl);
    },
    methods: {
      submitForm(event) {
        console.log("POST URL")
        console.log(this.postUrl)


        console.log(window.location.pathname);
        // console.log(event)
        // "http://localhost:8080/www/jaktsite/public/login"
          axios
            .post(this.postUrl, this.fields)
            .then(response => {
              this.fields = {};
              // console.log(response.request.responseURL)
              window.location = response.request.responseURL;
              // window.location = accountPage;
            })
            .catch(error => {
              console.log(error);
            });
      }
    }
    
  }
</script>