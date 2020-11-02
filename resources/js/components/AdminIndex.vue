<template>
    <div>
        <sidebar-menu :menu="menu" :disableHover="true" :collapsed="true" :width="'350px'" :relative="false" @item-click="onItemClick"/>
        <div style="margin-left: 70px">
            <div v-if="page == 'users_table'" class='right_correction'>
                <p>ANVÄNDARE</p>
                <div>
                    <mdb-datatable
                        :data="data"
                        striped
                        bordered
                        responsive
                        :tfoot="false"
                        
                        
                    />
                </div>
            </div>
            <div v-else-if="page == 'edit_user'" class='right_correction'>
                <h6>#{{this.account_edit.id}}, {{this.account_edit.firstname}} {{this.account_edit.lastname}}</h6>
                <mdb-card>
                    <mdb-card-body class="infopart">
                        <form @submit.prevent="updateUser">
                            <label v-if="account_edit.occupation != 'webmaster'" class="mt-4 text-muted" style="font-size: 12px;" for="activeselect">Aktiv</label>
                            <select v-if="account_edit.occupation != 'webmaster'" id="activeselect" class="mb-2 custom-select custom-select-sm" v-model="account_edit.active">
                                <option selected>{{account_edit.active}}</option>
                                <option value="yes">yes</option>
                                <option value="no">no</option>
                            </select>
                            <label v-if="account_edit.occupation != 'webmaster'" class="text-muted" style="font-size: 12px;" for="roleselect">Roll</label>
                            <select v-if="account_edit.occupation != 'webmaster'" id="roleselect" class="custom-select custom-select-sm" v-model="account_edit.role">
                                <option selected>{{account_edit.role}}</option>
                                <option value="admin">admin</option>
                                <option value="user">user</option>
                                <option value="guest">guest</option>
                            </select>
                            <mdb-input label="Avdelning" v-model="account_edit.occupation" disabled/>
                            <mdb-input label="Användarnamn" v-model="account_edit.username" disabled />
                            <mdb-input label="Email" v-model="account_edit.email" />
                            <mdb-input label="Förnamn" v-model="account_edit.firstname" />
                            <mdb-input label="Efternamn" v-model="account_edit.lastname" />
                            <mdb-input label="Adress" v-model="account_edit.address"  />
                            <mdb-input label="Postnummer" v-model="account_edit.postnumber"  />
                            <mdb-input label="Ort" v-model="account_edit.city"  />
                            <mdb-input label="Mobilnummer" v-model="account_edit.mobilenumber"  />
                            <mdb-input label="Tel." v-model="account_edit.phonenumber"  />
                            <input type="hidden" name="_token" :value="csrf">
                            
                            
                            <div class="d-flex flex-row justify-content-around" style="margin-top: -10px;">
                                <mdb-btn size="sm" color="mdb-color" type="submit"><mdb-icon icon="user-edit" class="ml-1"/> - Uppdatera</mdb-btn>
                            </div>
                        </form>
                    </mdb-card-body>
                    </mdb-card>
                    <mdb-card class="mt-2">
                     <mdb-card-body class="infopart">
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
            </div>
            <div v-else-if="page == 'users_new'" class='right_correction'>
                <p>NY ANVÄNDARE</p>


                <mdb-card>
               
                <mdb-card-body class="infopart">
            <!-- Material form create user -->
            <!-- @submit.prevent="submitForm" -->
                <form @submit.prevent="createUser" class="formpart mt-2">
                        <label class="text-muted" style="font-size: 12px;" for="roleselect">Aktiv</label>
                        <select id="roleselect" class="custom-select custom-select-sm" v-model="newUser.active">
                            <option value="yes">yes</option>
                            <option value="no">no</option>
                        </select>
                        <label class="text-muted" style="font-size: 12px;" for="roleselect">Roll</label>
                        <select id="roleselect" class="custom-select custom-select-sm" v-model="newUser.role">
                            <option selected>user</option>
                            <option value="guest">guest</option>
                            <option value="admin">admin</option>
                        </select>
                        <label class="text-muted" style="font-size: 12px;" for="roleselect">Avdelning</label>
                        <select id="roleselect" class="custom-select custom-select-sm" v-model="newUser.occupation">
                            <option selected>hunter</option>
                            <option value="devaccount">devaccount</option>
                        </select>
                        <mdb-input label="Användarnamn" v-model="newUser.username" />
                        <mdb-input label="Email" type="email" v-model="newUser.email" />
                        <mdb-input label="Förnamn" v-model="newUser.firstname" />
                        <mdb-input label="Efternamn" v-model="newUser.lastname" />
                        <mdb-input label="Lösenord" type="password" v-model="newUser.password1" />
                        <mdb-input label="Bekräfta lösenord" type="password" v-model="newUser.password2" />
                        <input type="hidden" name="_token" :value="csrf">
                        <div class="text-center">
                            <mdb-btn color="mdb-color" type="submit"><mdb-icon icon="user-plus" class="ml-1"/> - Skapa</mdb-btn>
                        </div>
                         
                        <div class="d-flex flex-row justify-content-around" >
                            <span class="error_message">{{new_user_message}}</span>
                        </div>

                    </form>
            <!-- Material form create user -->
                </mdb-card-body>
            </mdb-card>


            </div>
            <div v-else-if="page == 'charts'">
                <p>DIAGRAM</p>
            </div>
            <div v-else-if="page == 'reports'">
                <p>RAPPORTER</p>
            </div>
        </div>
    </div>
</template>

<script>
import { SidebarMenu } from 'vue-sidebar-menu';
 import { mdbDatatable, mdbBtn, mdbCard, mdbCardBody, mdbInput, mdbContainer, mdbIcon } from 'mdbvue';
export default {
    components: {
            SidebarMenu,
            mdbDatatable,
            mdbBtn,
            mdbCard,
            mdbCardBody,
            mdbInput,
            mdbContainer,
            mdbIcon
        },
        props:[
            'accountPage',
            'accounts',
            'userBaseUrl'
        ],
    data() {
        return {
            menu: [
                {
                    header: true,
                    title: 'ADMIN',
                    hiddenOnCollapse: true
                },
                {
                    // href: '/',
                    title: 'Användare',
                    icon: 'fa fa-user',
                    child: [
                        {
                            // href: '/charts/sublink',
                            title: 'Användare - tabell'
                        },
                        {
                            title: 'Användare - ny'
                        }
                    ]
                },
                {
                    // href: '/',
                    title: 'Rapporter',
                    icon: 'fa fa-file-alt'
                },
                {
                    // href: '/charts',
                    title: 'Diagram',
                    icon: 'fa fa-chart-area',
                    child: [
                        {
                            // href: '/charts/sublink',
                            title: 'Sub Link'
                        }
                    ]
                },
                {
                    // href: '/charts',
                    title: 'Lämna',
                    icon: 'fa fa-backward',
                }
            ],
            page: 'users_table',
            account_edit: null,
            account_edit_password1: null,
            account_edit_password2: null,
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            new_password_message: '',
            new_user_message: '',
            newUser: {
                active: 'yes',
                role: 'user',
                occupation: 'hunter',
                username: '',
                email: '',
                firstname: '',
                lastname: '',
                password1: '',
                password2: ''
            },

            data: {
                columns: [
                    {
                    label: 'Ändra',
                    field: 'edit',
                    sort: false
                    },
                    {
                    label: 'id',
                    field: 'id',
                    sort: true
                    },
                    {
                    label: 'Namn',
                    field: 'name',
                    sort: true
                    },
                    {
                    label: 'Användarnamn',
                    field: 'username',
                    sort: true
                    },
                    {
                    label: 'Avdelning',
                    field: 'occupation',
                    sort: true
                    },
                    {
                    label: 'Roll',
                    field: 'role',
                    sort: true
                    },
                    {
                    label: 'Aktiv',
                    field: 'active',
                    sort: true
                    },
                    {
                    label: 'Email',
                    field: 'email',
                    sort: true
                    },

                ],
                rows: this.tablerows()
            }
        }
    },
    computed: {
       
    },
    created(){
        window.editUser = this.editUser;
        },
    mounted() {
        console.log("userbaseurl: ", this.userBaseUrl);
    },
    methods: {
         tablerows() {
            let table_rows = _.cloneDeep(this.accounts);
            table_rows.forEach(account => {
                // account['edit'] =  "<mdb-btn color='mdb-color' size='sm'>hej</mdb-btn>";
                let id = account.id;
                account['edit'] =  "<button onclick='editUser("+id+")' class='btn btn-mdb-color btn-sm fa fa-user-edit'></button>";
                account['name'] = account.firstname +" "+ account.lastname;

            });
            return table_rows;
        },
        editUser(id) {
            // får idnummer på user från editknappen i tabellen.
            let account = this.accounts.filter(obj => {
                return obj.id === id;
            });
            this.account_edit = account[0];
            // byt sida till edit_user
            this.page = 'edit_user';

        },
        onItemClick(event, item, node) {
            console.log('event ', event);
            console.log('item ', item);
            console.log('node ', node);
            
            if(item.title == 'Användare - tabell') {
                this.page = 'users_table';
            } else if( item.title == 'Användare - ny') {
                this.page = 'users_new';
            } else if( item.title == 'Diagram') {
                this.page = 'charts';
            } else if( item.title == 'Rapporter') {
                this.page = 'reports';
            } else if( item.title == 'Lämna') {
                window.location = this.accountPage;
            }
        },
        updateUser(event) {
                let updateUserUrl = this.userBaseUrl + '/' + this.account_edit.id + '/update';
                console.log("updateUserUrl: ", updateUserUrl);
				axios.patch(updateUserUrl, this.account_edit)
					.then(response => {
						this.account_edit = null;
						this.page = 'users_table';
					})
					.catch(error => {
						console.log('update user error: ', error);
					});
        },
        updatePassword() {
            let updateUserUrl = this.userBaseUrl + '/' + this.account_edit.id + '/update';
            if(this.account_edit_password1 != null && this.account_edit_password1 != '') {
                if(this.account_edit_password1 === this.account_edit_password2) {
                    this.account_edit.password = this.account_edit_password1;

                    console.log('this.account_edit: ', this.account_edit)
                    axios.patch(updateUserUrl, this.account_edit)
                        .then(response => {
                            this.account_edit = null;
                            this.page = 'users_table';
                            this.new_password_message = '';
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
        createUser() {
            let storeUserUrl = this.userBaseUrl + '/store';

            let username_check = this.accounts.filter(obj => {
                return obj.username === this.newUser.username;
            });

            console.log("username_check: ", username_check);
            
            let email_check = this.accounts.filter(obj => {
                return obj.email === this.newUser.email;
            });


            if(username_check.length == 0) {

                if(email_check.length == 0 || this.newUser.email == '') {
                    if(this.newUser.username != null && this.newUser.username != '') {
                        if(this.newUser.password1 === this.newUser.password2) {
                            if(this.newUser.password1 != null && this.newUser.password2 != '') {
                                let userToCreate = {
                                    active: this.newUser.active,
                                    role: this.newUser.role,
                                    occupation: this.newUser.occupation,
                                    username: this.newUser.username,
                                    email: this.newUser.email,
                                    firstname: this.newUser.firstname,
                                    lastname: this.newUser.lastname,
                                    password: this.newUser.password1,
                                }
                                axios.post(storeUserUrl, userToCreate)
                                    .then(response => {
                                        this.newUser = {
                                            active: 'yes',
                                            role: 'user',
                                            occupation: 'hunter',
                                            username: '',
                                            email: '',
                                            firstname: '',
                                            lastname: '',
                                            password1: '',
                                            password2: ''
                                        };
                                        this.new_password_message = '';
                                        window.location.reload();
                                        // this.page = 'users_table';
                                        
                                    })
                                    .catch(error => {
                                        console.log('update user error: ', error);
                                    });
                            } else {
                                this.new_user_message = "Får inte ange tomma lösenord"; 
                            }
                        } else {
                            this.new_user_message = "Lösenorden stämmer inte överens.";
                        }
                    } else {
                        this.new_user_message = "Måste ange ett användarnamn.";
                    }

                } else {
                    this.new_user_message = "Emailadressen upptagen av annat konto.";
                }
            } else {
                this.new_user_message = "Användarnamnet upptaget av annat konto.";
            }

        }
    }
}
</script> 
<style scoped>
.infopart {
	margin-top: -25px;
}
.right_correction {
    margin-right:20px;
}
.error_message {
    color: red;
    font-size: 12px;
}
</style>
