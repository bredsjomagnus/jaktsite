<template>
<div>

	<div class="d-flex flex-row justify-content-around" style="margin-top: -20px; margin-bottom: 5px; background-color: rgb(236 236 236);">
		<mdb-btn-toolbar>
			<mdb-btn-group size="sm">
				<mdb-btn size="sm" color="mdb-color" tag='a' :href="url.rapportarkivet">Arkivet</mdb-btn>
				<mdb-btn size="sm" color="mdb-color" tag='a' :href="url.killreport">Rapportera</mdb-btn>

				<mdb-btn v-if="authUser.role == 'admin'" size="sm" color="mdb-color" tag='a' :href="url.adminurl">Admin</mdb-btn>
			</mdb-btn-group>
		</mdb-btn-toolbar>
	</div>

	
	
  <mdb-card>
    <!-- <mdb-card-image src="https://mdbootstrap.com/img/Photos/Horizontal/Nature/4-col/img%20%286%29.jpg" alt="Card image cap"></mdb-card-image> -->
	<div class="d-flex justify-content-center" style="padding-top:10px; background: linear-gradient(#e6e6e6, #ececec 50%, #142837 50%, #142837 50%);">
		 <!-- <img :src="gravatarSrc" class="img-fluid z-depth-1 rounded-circle" :alt="authUser.username">		 -->
	  <div v-if="avatar" class="image_container">
		  <a :href="url.avatar"><mdb-card-image class="img-fluid rounded-circle" style="border: 3px solid rgb(20 40 55); background-color: #142837;" :alt="authUser.username" :src="avatarimageurl(avatar)"></mdb-card-image></a>

	  </div>
	  <div v-else>
     	<a :href="url.avatar"><mdb-card-image class="img-fluid rounded-circle" style="border: 3px solid rgb(20 40 55); background-color: #142837;" :alt="authUser.username" :src="gravatarSrc"></mdb-card-image></a>

	  </div>
    </div>
    <div class="d-flex justify-content-center" style="display:block; background-color: rgb(20, 40, 55); height: 40px;">
		<div class="align-middle pt-2">
      		<p style="color:white">{{fields.firstname}} {{fields.lastname}}</p>
		</div>
		
	</div>
	<div class="d-flex flex-row justify-content-around" style="margin-top: -5px; background-color: #e9ecef;">
		<mdb-btn-toolbar class="w-100">
			<mdb-btn-group size="sm" class="w-100">
				<mdb-btn size="sm" color="elegant" tag='a' :href="url.avatar"><mdb-icon icon="camera"/></mdb-btn>
				<mdb-btn :disabled="true" size="sm" color="elegant" tag='a' href="#"><mdb-icon icon="images"/></mdb-btn>
				<mdb-btn size="sm" color="elegant" tag='a' :href="url.userreports"><mdb-icon icon="file-alt"/></mdb-btn>
			</mdb-btn-group>
		</mdb-btn-toolbar>
	</div>

	

	<div v-if="authUser.occupation == 'hunter'">

		<div class="d-flex flex-row justify-content-center mt-2">
			<h6>DINA RAPPORTER OCH DJUR</h6>
		</div>
		<div class="d-flex flex-row justify-content-center mt-2" style="font-size: 12px;">

			<i>Associerad med {{killreports.length}} rapporter i rapportarkivet.</i>
		</div>
		<div class="d-flex flex-row justify-content-center mt-2">

			<table class="table-striped meattable" style="width: 90%">
				<thead>
					<tr>
						<th class="pl-2">DJURSLAG</th>
						<th style="text-align: left;">SNITT</th>
						<th style="text-align: left;">TOTALT</th>
					</tr>
				</thead>
				<tbody>
					<tr>
						<td class="pl-2">Kronvilt</td>
						<td style="text-align: left;">{{meatReddeerAverage.kg}} kg</td>
						<td style="text-align: left;">{{meatReddeerTotal.kg}} kg</td>
					</tr>
					<tr>
						<td class="pl-2">Dovvilt</td>
						<td style="text-align: left;">{{meatFallowdeerAverage.kg}} kg</td>
						<td style="text-align: left;">{{meatFallowdeerTotal.kg}} kg</td>
					</tr>
					<tr>
						<td class="pl-2">Älg</td>
						<td style="text-align: left;">{{meatMooseAverage.kg}} kg</td>
						<td style="text-align: left;">{{meatMooseTotal.kg}} kg</td>
					</tr>
					<tr>
						<td class="pl-2">Vildsvin</td>
						<td style="text-align: left;">{{meatBoarAverage.kg}} kg</td>
						<td style="text-align: left;">{{meatBoarTotal.kg}} kg</td>
					</tr>
					<tr>
						<td class="pl-2">Rådjur</td>
						<td style="text-align: left;">{{meatRoedeerAverage.kg}} kg</td>
						<td style="text-align: left;">{{meatRoedeerTotal.kg}} kg</td>
					</tr>
				</tbody>
			</table>
		</div>
	<hr>
	</div>

	<div class="d-flex flex-row justify-content-center mt-2">
		<h6>RESURSER</h6>
	</div>
	<div style="font-size: 12px;">
		<ul>
			<li><a class="pb-2" target="_blank" href="https://photos.google.com/u/1/share/AF1QipMq-tBl10ISOORKYdwt3hJdlkPkyUjLlCcJD8k9ExAwiJ5CnTU7E9oy64Vft1oCOw?key=QkNMdEtOcU96SW1WdnJZMVppVmRmcFlmb0QxT2tn">SMÅRIS GOOGLE FOTO ALBUM <mdb-icon icon="external-link-alt" class="ml-1"/></a></li>
			<!-- <li><a class="pb-2" target="_blank" href="https://mail.google.com/mail/u/3/">SMÅRIS GMAIL <mdb-icon icon="external-link-alt" class="ml-1"/></a></li> -->
		</ul>
		
	</div>

	<hr>

    <mdb-card-body class="infopart">
      <!-- <mdb-card-title>Profildata</mdb-card-title> -->
	  	<div class="d-flex flex-row justify-content-center mt-2">
			<h6>DIN PROFILDATA</h6>
		</div>
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
			
			
			<div class="d-flex flex-row justify-content-around" style="margin-top: -10px;">
				<mdb-btn size="sm" color="mdb-color" type="submit"><mdb-icon icon="user-edit" class="ml-1"/> - Uppdatera</mdb-btn>
			</div>
			

		</form>
				</mdb-card-body>
		</mdb-card>

		<mdb-card class="mt-2">
                     <mdb-card-body>
                    <!-- <mdb-card-title>Profildata</mdb-card-title> -->
                        <form @submit.prevent="updatePassword">
                            <mdb-input label="Nytt lösenord" v-model="account_edit_password1" type='password' />
                            <mdb-input label="Bekräfta lösenord" v-model="account_edit_password2" type='password' />
                            <input type="hidden" name="_token" :value="csrf">
                            
                            
                            <div class="d-flex flex-row justify-content-around" style="margin-top: -10px;">
                                <mdb-btn size="sm" color="mdb-color" type="submit"><mdb-icon icon="user-edit" class="ml-1"/> - Nytt lösenord</mdb-btn>
                            </div>
                            <div class="d-flex flex-row justify-content-around" >
                                <span class="error_message">{{new_password_message}}</span>
                            </div>
                        </form>
                    </mdb-card-body>
                   
                </mdb-card>
		

		<mdb-card class="mt-2">
                     <mdb-card-body>
		<form @submit.prevent="logout">
			<div class="d-flex flex-row justify-content-around">
				<mdb-btn size="sm" color="elegant" type="submit" :href="url.logouturl">Logga ut</mdb-btn>
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
			'avatar',
			'gravatarSrc',
			'killreporturl',
			'killreportindexurl',
			'killreports',
			'adminurl',
			'logouturl',
			'welcomeurl',
			'userreportsurl',
			'avatarurl',
			'storageBaseUrl',
			'meatMooseAverage',
            'meatReddeerAverage',
            'meatFallowdeerAverage',
            'meatRoedeerAverage',
            'meatBoarAverage',
            'meatMooseTotal',
            'meatReddeerTotal',
            'meatFallowdeerTotal',
            'meatRoedeerTotal',
            'meatBoarTotal',
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
					phonenumber: this.authUser.phonenumber,

				},
				url: {
					update: window.location.pathname + "/update",
					killreport: this.killreporturl,
					rapportarkivet: this.killreportindexurl,
					adminurl: this.adminurl,
					logouturl: this.logouturl,
					welcomeurl: this.welcomeurl,
					avatar: this.avatarurl,
					userreports: this.userreportsurl
				},
				new_password_message: '',
				account_edit_password1: null,
				account_edit_password2: null
			}
		},
		mounted() {
			console.log(this.authUser);
			console.log(this.gravatarSrc);
			console.log(this.url.update);
			console.log(this.url.killreport);
			console.log("avatar: ", this.avatar);
			console.log("storageBaseUrl: ", this.storageBaseUrl);
			console.log("killreports: ", this.killreports);
			console.log("MEAT:");
			// console.log("meatMooseAverage: ", this.meatMooseAverage[0].kg);
			// console.log("meatReddeerAverage: ", this.meatReddeerAverage);
			// console.log("meatFallowdeerAverage: ", this.meatFallowdeerAverage);
			// console.log("meatRoedeerAverage: ", this.meatRoedeerAverage);
			// console.log("meatBoarAverage: ", this.meatBoarAverage);
		},
		methods: {
			avatarimageurl(avatar) {
                // lägger till datestamp för att inte uppdateringarna skall hänga sig i cache. Då ser webbläsaren bilden som ny varje gång.
                const datestamp = Date.now();
                let url = this.storageBaseUrl+"/i"+avatar.id+"_u"+avatar.user_id+"_"+avatar.name;
                console.log("avatarurl: ", url+"?"+datestamp);
                return url+"?"+datestamp;
            },
			submitForm(event) {
				axios.patch(this.url.update, this.fields)
					.then(response => {
						this.fields = {};
						// console.log(response.request.responseURL)
						// window.location = response.request.responseURL;	// redirect to whatever the response from controller method says.
						window.location.reload();
					})
					.catch(error => {
						console.log(error);
					});
			},
			updatePassword() {
                if(this.account_edit_password1 != null && this.account_edit_password1 != '') {
                    if(this.account_edit_password1 === this.account_edit_password2) {
                        this.fields.password = this.account_edit_password1;

                        console.log('this.fields: ', this.fields)
                        axios.patch(this.url.update, this.fields)
                            .then(response => {
                                this.fields = {};
								// console.log(response.request.responseURL)
								// window.location = response.request.responseURL;	// redirect to whatever the response from controller method says.
								window.location.reload();
                            })
                            .catch(error => {
                                console.log('update user error: ', error);
                            });
                        
                    } else {
                        this.new_password_message = "Lösenorden stämmer inte överens.";
                    }
                    
                } else {
                    this.new_password_message = "Får inte ange tomma lösenord";
                }
            },
			logout(event) {
				axios.post(this.url.logouturl).then(() => location.href = this.url.welcomeurl);
			}
		}
	}
</script>
<style scoped>
.infopart {
	margin-top: -25px;
}
.error_message {
    color: red;
    font-size: 12px;
}
.image_container{
  width: 100px;
}
.meatable {
	width: 95% !important;
}
table th {
	font-size: 0.8rem;
	font-weight: 400;
	background-color: #DCCC9B;
}

</style>