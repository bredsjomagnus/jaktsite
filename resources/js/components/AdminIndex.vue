<template>
    <div>
        <sidebar-menu :menu="menu" :disableHover="true" :collapsed="true" :width="'350px'" :relative="false" @item-click="onItemClick"/>
        <div style="margin-left: 70px">
            <div v-if="page == 'users'" class='right_correction'>
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
                    <!-- <mdb-card-title>Profildata</mdb-card-title> -->
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
            page: 'users',
            account_edit: null,
            account_edit_password1: null,
            account_edit_password2: null,
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            new_password_message: '',

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
                this.page = 'users';
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
						this.page = 'users';
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
                                this.page = 'users';
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
