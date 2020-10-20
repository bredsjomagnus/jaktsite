<template>
<div>
	
  <mdb-card>
    <!-- <mdb-card-image src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%286%29.jpg" alt="Card image cap"></mdb-card-image> -->
	<div class="d-flex justify-content-center" style="padding-bottom:16px; padding-top:10px; background-color: rgb(122, 160, 189);">
		 <!-- <img :src="gravatarSrc" class="img-fluid z-depth-1 rounded-circle" :alt="authUser.username">		 -->

      <a href="https://en.gravatar.com/"><mdb-card-image class="img-fluid z-depth-2 rounded-circle" :alt="authUser.username" :src="gravatarSrc"></mdb-card-image></a>
    </div>
    <div class="d-flex justify-content-center" style="display:block; background-color: rgb(20, 40, 55); height: 40px;">
		<div class="align-middle pt-2">
      		<p style="color:white">{{fields.firstname}} {{fields.lastname}}</p>
		</div>
	</div>

	<div class="d-flex flex-row justify-content-around">
		<mdb-btn-toolbar>
			<mdb-btn-group size="sm">
				<mdb-btn size="sm" color="mdb-color" tag='a' :href="url.rapportarkivet">Arkivet</mdb-btn>
				<mdb-btn size="sm" color="mdb-color" tag='a' :href="url.killreport">Rapportera</mdb-btn>

				<mdb-btn v-if="authUser.role == 'admin'" size="sm" color="mdb-color" tag='a' :href="url.adminurl">Admin</mdb-btn>
			</mdb-btn-group>
		</mdb-btn-toolbar>
	</div>

		

    <mdb-card-body class="infopart">
      <!-- <mdb-card-title>Profildata</mdb-card-title> -->
	  	<form @submit.prevent="submitForm">
			<mdb-input label="Användarnamn" v-model="fields.username" disabled />
			<mdb-input label="Email" v-model="fields.email" disabled />
			<mdb-input label="Förnamn" v-model="fields.firstname" />
			<mdb-input label="Efternamn" v-model="fields.lastname" />
			<mdb-input label="Adress" v-model="fields.address"  />
			<mdb-input label="Postnummer" v-model="fields.postnumber"  />
			<mdb-input label="Ort" v-model="fields.city"  />
			<mdb-input label="Mobilnummer" v-model="fields.mobilenumber"  />
			<mdb-input label="Tel." v-model="fields.phonenumber"  />
			<input type="hidden" name="_token" :value="csrf">
			<div class="text-center">
				<mdb-btn color="mdb-color" type="submit"><mdb-icon icon="user-edit" class="ml-1"/> - Uppdatera</mdb-btn>
			</div>

		</form>
    </mdb-card-body>
  </mdb-card>
  </div>
</template>
<script>
	import axios from "axios";
	import { mdbCard, mdbCardImage, mdbCardBody, mdbCardTitle, mdbCardText, mdbBtn, mdbInput, mdbIcon, mdbBtnGroup, mdbBtnToolbar} from 'mdbvue';
	export default {
		name: 'CardPage',
		components: {
			mdbCard,
			mdbCardImage,
			mdbCardBody,
			mdbCardTitle,
			mdbCardText,
			mdbBtn,
			mdbInput,
			mdbIcon,
			mdbBtnGroup,
			mdbBtnToolbar
		},
		props: [
			'authUser',
			'gravatarSrc',
			'killreporturl',
			'killreportindexurl',
			'adminurl'
			],
		data() {
			return {
				gravatar: this.gravatarSrc,
				csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
				fields: {
					_method: 'PATCH', // Route.patch(....)
					username: this.authUser.username,
					email: this.authUser.email,
					firstname: this.authUser.firstname,
					lastname: this.authUser.lastname,
					address: this.authUser.address,
					postnumber: this.authUser.postnumber,
					city: this.authUser.city,
					mobilenumber: this.authUser.mobilenumber,
					phonenumber: this.authUser.phonenumber
				},
				url: {
					update: window.location.pathname + "/update",
					killreport: this.killreporturl,
					rapportarkivet: this.killreportindexurl,
					adminurl: this.adminurl
				}
			}
		},
		mounted() {
			console.log(this.authUser);
			console.log(this.gravatarSrc);
			console.log(this.url.update);
			console.log(this.url.killreport);
		},
		methods: {
			submitForm(event) {
			axios.post(this.url.update, this.fields)
				 .then(response => {
					this.fields = {};
					// console.log(response.request.responseURL)
					window.location = response.request.responseURL;	// redirect to whatever the response from controller method says.
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
</style>