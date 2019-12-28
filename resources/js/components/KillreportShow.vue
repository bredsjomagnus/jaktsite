<template>
   <div>

       <!-- MODAL FÖR ATT ÄNDRA SKYTT -->
        <mdb-modal size="sm" :show="shooterModal" @close="shooterModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra skytt</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <div
                    v-for="hunter in hunters"
                    :key="hunter.id"
                    >   
                        <div class="d-flex justify-content-center">
                            <mdb-btn class="mb-0" style="width: 300px" :color="shooterId == hunter.id ? 'indigo' : 'grey'" @click="setShooter(hunter)">{{hunter.firstname}} {{hunter.lastname}}</mdb-btn>
                        </div>    
                    </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="shooterModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

       <!-- MODAL FÖR ATT ÄNDRA RAPPORTÖR -->
        <mdb-modal size="sm" :show="reporterModal" @close="reporterModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra rapportör</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <div
                    v-for="hunter in hunters"
                    :key="hunter.id"
                    >   
                        <div class="d-flex justify-content-center">
                            <mdb-btn class="mb-0" style="width: 300px" :color="reporterId == hunter.id ? 'indigo' : 'grey'" @click="setReporter(hunter)">{{hunter.firstname}} {{hunter.lastname}}</mdb-btn>
                        </div>    
                    </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="reporterModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

       <!-- MODAL FÖR ATT ÄNDRA OMRÅDE -->
        <mdb-modal size="sm" :show="areaModal" @close="areaModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra område</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <div
                    v-for="area in areas"
                    :key="area.id"
                    >   
                        <div class="d-flex justify-content-center">
                            <mdb-btn class="mb-0" style="width: 300px" :color="areaId == area.id ? 'indigo' : 'grey'" @click="setArea(area)">{{area.area_name}}</mdb-btn>
                        </div>    
                    </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="areaModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

       <!-- MODAL FÖR SORTS JAKT -->
        <mdb-modal size="sm" :show="kindofhuntModal" @close="kindofhuntModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra sorts jakt</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <div class="d-flex justify-content-center">
                    <mdb-btn class="mb-0" style="width: 300px" :color="kindofhuntSelected == 'Ensamjakt' ? 'indigo' : 'grey'" @click="setKindofhunt('Ensamjakt')">Ensamjakt</mdb-btn>
                </div>
                <div class="d-flex justify-content-center">
                    <mdb-btn class="mb-0" style="width: 300px" :color="kindofhuntSelected == 'Gemensam jakt' ? 'indigo' : 'grey'" @click="setKindofhunt('Gemensam jakt')">Gemensam jakt</mdb-btn>    
                </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="kindofhuntModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

       <!-- MODAL FÖR ÄNDRA DJURSLAG -->
        <mdb-modal size="sm" :show="speciesModal" @close="speciesModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra sorts jakt</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
               <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="speciesSelected == 'Älg' ? 'indigo' : 'grey'" @click="setSpecies('Älg')">Älg</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="speciesSelected == 'Kronvilt' ? 'indigo' : 'grey'" @click="setSpecies('Kronvilt')">Kronvilt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="speciesSelected == 'Dovvilt' ? 'indigo' : 'grey'" @click="setSpecies('Dovvilt')">Dovvilt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="speciesSelected == 'Rådjur' ? 'indigo' : 'grey'" @click="setSpecies('Rådjur')">Rådjur</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="speciesSelected == 'Vildsvin' ? 'indigo' : 'grey'" @click="setSpecies('Vildsvin')">Vildsvin</mdb-btn></div>
                </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="speciesModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>


       <mdb-card>
           <mdb-card-body class="cardborder">
               <mdb-card-title class="d-flex justify-content-center titlecolor p-1">SKYTT & RAPPORTÖR</mdb-card-title>
               
                <!-- rapportör -->
                <mdb-row>
                    <mdb-col col="9">
                        <mdb-input type="text" class="w-100" label="Rapportör" v-model="this.reporterName" />
                        <p class="inputmsg" v-if="authUser.role == 'admin'">Urspr. rapportör: {{this.originreporter}}</p>
                    </mdb-col>
                    <mdb-col col="2">
                            <mdb-btn v-if="authUser.role == 'admin'" class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="reporterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                    </mdb-col>
                </mdb-row>

                <!-- skytt -->
                <mdb-row>
                    <mdb-col col="9">
                        <mdb-input type="text" class="w-100" label="Skytt" v-model="this.shooterName" />
                        <p class="inputmsg">Urspr. skytt: {{this.originshooter}}</p>
                    </mdb-col>
                    <mdb-col col="2">
                            <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="shooterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                    </mdb-col>
                </mdb-row>

                <!-- typ av jakt -->
                <mdb-row>
                    <mdb-col col="9">
                        <mdb-input type="text" class="w-100" label="Sorts jakt" v-model="this.kindofhuntSelected" />
                        <p class="inputmsg">Urspr. sort: {{this.originkindofhunt}}</p>
                    </mdb-col>
                    <mdb-col col="2">
                            <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="kindofhuntModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                    </mdb-col>
                </mdb-row>
               
           </mdb-card-body>
       </mdb-card>

        <!-- tid och plats -->
        <mdb-card class="mt-2">
           <mdb-card-body :class="wrongkilldate ? 'cardbordererror' : 'cardborder'">
               <mdb-card-title class="d-flex justify-content-center titlecolor p-1">TID & PLATS</mdb-card-title>
               <mdb-input style="color: red;" :class="wrongkilldate ? 'error' : ''" type="date" v-model="killreport.killdate" @change="checkKilldate"/>
               <p class="errormsg" v-if="wrongkilldate">Ogiltigt datum</p>
               <p class="inputmsg" v-else>Urspr. datum: {{this.origindate}}</p>
               <mdb-row>
                   <mdb-col col="9">
                       <mdb-input type="text" v-model="areaSelected.area_name"/>
                       <p class="inputmsg">Urspr. område: {{this.originarea}}</p>
                   </mdb-col>
               
                    <mdb-col col="2">
                            <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="areaModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                    </mdb-col>
                </mdb-row>
               <mdb-input v-if="killreport.place != null" type="textarea" label="Beskrivning av plats" v-model="killreport.place" :rows="5"/>
           </mdb-card-body>
       </mdb-card>

        <!-- djur -->
        <mdb-card class="mt-2">
           <mdb-card-body class="cardborder">
               <mdb-card-title class="d-flex justify-content-center titlecolor p-1">DJUR</mdb-card-title>
                <mdb-row>
                    <mdb-col col="9">
                        <mdb-input type="text" class="w-100" label="Djurslag" v-model="speciesSelected" />
                        <p class="inputmsg" v-if="authUser.role == 'admin'">Urspr. djurslag: {{this.originSpecies}}</p>
                    </mdb-col>
                    <mdb-col col="2">
                        <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="speciesModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                    </mdb-col>
                </mdb-row>
           </mdb-card-body>
       </mdb-card>

   </div>
</template>
<script>
  import { mdbBtn, mdbBtnGroup, mdbDropdown, mdbDropdownItem, mdbDropdownMenu, mdbDropdownToggle, mdbCard, mdbCardBody, mdbCardTitle, mdbCardText, mdbRow, mdbCol, mdbBadge, mdbInput, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbIcon, mdbCardImage } from 'mdbvue';
  export default {
    name: 'showkillreport',
    components: {
      mdbBtn,
      mdbBtnGroup,
      mdbDropdown,
      mdbDropdownItem,
      mdbDropdownMenu,
      mdbDropdownToggle,
      mdbCard,
      mdbCardBody,
      mdbCol,
      mdbRow,
      mdbCardTitle,
      mdbCardText,
      mdbBadge,
      mdbInput,
      mdbBtnToolbar,
      mdbModal,
      mdbModalHeader,
      mdbModalTitle,
      mdbModalBody,
      mdbModalFooter,
      mdbIcon,
      mdbCardImage
    },
    props: [
            'authUser',
            'hunters',
            'shooter',
            'reporter',
            'area',
            'areas',
            'killreport',
            'animal'
        ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            shooterSelected: this.shooter,
            reporterSelected: this.reporter,
            areaSelected: this.area,
            kindofhuntSelected: this.killreport.kindofhunt,
            speciesSelected: this.animal.species,
            shooterModal: false,
            reporterModal: false,
            kindofhuntModal: false,
            speciesModal: false,
            specistypeModal: false,
            areaModal: false,
            killdateset: true,
            wrongkilldate: false,
            origindate: this.killreport.killdate,
            originarea: this.area.area_name,
            originshooter: this.shooter.firstname +" "+this.shooter.lastname,
            originreporter: this.reporter.firstname +" "+this.reporter.lastname,
            originkindofhunt: this.killreport.kindofhunt,
            originSpecies: this.animal.species,
            originSpeciestype: this.animal.speciestype,
        }

    },
    computed: {
        shooterName() {
            return this.shooterSelected.firstname + " " + this.shooterSelected.lastname;
        },
        shooterId() {
            return this.shooterSelected.id;
        },
        skyttlabel() {
            return "Skytt (urspr. " + this.shooter.firstname +" "+ this.shooter.lastname +")";
        },
        reporterName() {
            return this.reporterSelected.firstname + " " + this.reporterSelected.lastname;
        },
        reporterId() {
            return this.reporterSelected.id;
        },
        reporterId() {
            return this.areaSelected.id;
        },
    },
    mounted() {
        console.log("hunters: ");
        console.log(this.hunters);
        console.log("shooter: ");
        console.log(this.shooter);
        console.log("reporter: ");
        console.log(this.reporter);
        console.log("area: ");
        console.log(this.area);
        console.log("areas: ");
        console.log(this.areas);
        console.log("animal: ");
        console.log(this.animal);
        console.log("killreport: ");
        console.log(this.killreport);

    },
    methods: {
        setShooter(shooter) {
            this.shooterSelected = shooter;
            this.shooterModal = false;
        },
        setReporter(reporter) {
            this.reporterSelected = reporter;
            this.reporterModal = false;
        },
        setKindofhunt(kindofhunt) {
            this.kindofhuntSelected = kindofhunt;
            this.kindofhuntModal = false;
        },
        setArea(area) {
            this.areaSelected = area;
            this.areaModal = false;
        },
        setSpecies(species) {
            this.speciesSelected = species;
            this.speciesModal = false;
        },
        checkKilldate() {
            let thenow = Date.now();
            this.thekilldate = new Date(this.killreport.killdate);
            if(this.thekilldate >= thenow) {
                this.wrongkilldate = true;
                this.killdateset = false;
            } else {
                this.wrongkilldate = false;
                this.killdateset = true;
            }
            if(this.killreport.killdate == "" || this.killreport.killdate == null) {
                
                this.wrongkilldate = true;
                this.killdateset = false;
                console.log("this.wrongkilldate:");
                console.log(this.wrongkilldate);
            }
        }
    }
  }
</script>
<style scope>
.titlecolor {
    border-bottom: 1px solid #e8e8e8;
    font-size: 16px;
}
.error > input[type=date]{
    color:red;
}
.errormsg {
    margin-top: -20px;
    font-size: 12px;
    font-style: italic;
    color: red;
}
.inputmsg {
    margin-top: -20px;
    font-size: 12px;
    font-style: italic;
}
.cardborder {
    border-left: 10px solid #59698d;
}
.cardbordererror{
    border-left: 10px solid red;
}
    
</style>