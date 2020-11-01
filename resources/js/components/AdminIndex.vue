<template>
    <div>
        <sidebar-menu :menu="menu" :collapsed="true" :width="'200px'" :relative="false" @item-click="onItemClick"/>
        <div style="margin-left: 70px">
            <div v-if="page == 'users'">
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
 import { mdbDatatable, mdbBtn } from 'mdbvue';
export default {
    components: {
            SidebarMenu,
            mdbDatatable,
            mdbBtn
        },
        props:[
            'accountPage',
            'accounts'
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
                    icon: 'fa fa-user'
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

            data: {
                columns: [
                    {
                    label: 'Redigera',
                    field: 'edit',
                    sort: false
                    },
                    {
                    label: 'id',
                    field: 'id',
                    sort: true
                    },
                    {
                    label: 'Förnamn',
                    field: 'firstname',
                    sort: true
                    },
                    {
                    label: 'Efternamn',
                    field: 'lastname',
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
    mounted() {
        this.table_rows = _.cloneDeep(this.accounts);
        this.table_rows.forEach(account => {
            account['edit'] = '<mdb-';

        });

        console.log('users', this.table_rows);
    },
    methods: {
         tablerows() {
            let table_rows = _.cloneDeep(this.accounts);
            table_rows.forEach(account => {
                // account['edit'] =  "<mdb-btn color='mdb-color' size='sm'>hej</mdb-btn>";
                account['edit'] =  "<button class='btn btn-unique fa fa-user-edit'></button>";

            });
            return table_rows;
        },
        onItemClick(event, item, node) {
            console.log('event ', event);
            console.log('item ', item);
            console.log('node ', node);
            
            if(item.title == 'Användare') {
                this.page = 'users';
            } else if( item.title == 'Diagram') {
                this.page = 'charts';
            } else if( item.title == 'Rapporter') {
                this.page = 'reports';
            } else if( item.title == 'Lämna') {
                window.location = this.accountPage;
            }
        }
    }
}
</script> 
