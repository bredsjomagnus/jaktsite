<template>
    <div>
        <div>
            <div class="d-flex flex-row justify-content-around" style="margin-top:-20px">
                <mdb-card class='w-100' color="unique-color-dark">
                    <mdb-card-text class="d-flex justify-content-center">{{this.steptitle}}</mdb-card-text>
                </mdb-card>
            </div>           
            <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                <mdb-btn color="mdb-color" @click.native="backToUserModal = true" size="sm"><mdb-icon icon="user"/></mdb-btn>
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateQ" :active="activeQ" size="sm">Data</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateR" :active="activeR" size="sm">Rapport</mdb-btn>
                </mdb-btn-group>
                <mdb-btn color="danger" @click.native="confirmModal = true" size="sm"><mdb-icon icon="eraser"/></mdb-btn>
            </div>
            
               
                
            <!-- </mdb-btn-toolbar> -->
        </div>

        <mdb-modal size="sm" :show="confirmModal" @close="confirmModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Rensa data?</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <p>Ifall du vill börja om från början.</p>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="danger" size="sm" @click.native="clearReportData">Rensa</mdb-btn>
                <mdb-btn color="blue-grey" size="sm" @click.native="confirmModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

        <mdb-modal size="sm" :show="backToUserModal" @close="backToUserModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Återgå till 'Min sida'?</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <p>All data nollställs.</p>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="danger" size="sm" @click.native="cancelReportProcess">Gå till 'Min Sida'</mdb-btn>
                <mdb-btn color="blue-grey" size="sm" @click.native="backToUserModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>
 
        <mdb-card
        v-if="card === 'questions'"
        >
            <mdb-card-body 
            v-if="step === 'shooter'"
            >
                <div class="d-flex flex-column">
                    <div
                    v-for="hunter in hunters"
                    :key="hunter.id"
                    >
                        <div class="p-0">   
                            <mdb-btn :color="fields.shooter_id == hunter.id ? 'indigo' : 'grey'" @click="setShooter(hunter)" class='w-100 m-0 mb-1'>{{hunter.firstname}} {{hunter.lastname}}</mdb-btn>
                        </div>    
                    </div>
                </div>
            </mdb-card-body>

            <!-- KINDOFHUNT -->
            <mdb-card-body 
            v-else-if="step === 'kindofhunt'"
            >
                <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.kindofhunt == 'Ensamjakt' ? 'indigo' : 'grey'" @click="setKindOfHunt('Ensamjakt')">Ensamjakt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.kindofhunt == 'Gemensam jakt' ? 'indigo' : 'grey'" @click="setKindOfHunt('Gemensam jakt')">Gemensam jakt</mdb-btn></div>
                </div>
                <mdb-btn color="blue-grey" @click.native="stepBackFromKindOfHunt()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="fields.kindofhunt != null"
                color="blue-grey" 
                @click.native="setKindOfHunt(fields.kindofhunt)"
                size="sm">
                <mdb-icon icon="chevron-right"/>
                </mdb-btn>
            </mdb-card-body>

            <!-- AREA -->
            <mdb-card-body 
            v-else-if="step === 'area'"
            >
                <div class="d-flex flex-column"
                v-for="area in areas"
                :key="area.id"
                >
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.area_id == area.id ? 'indigo' : 'grey'" @click="setArea(area)">{{area.area_name}}</mdb-btn></div>
                </div>
                <mdb-btn color="blue-grey" @click.native="stepBackFromAreas()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="fields.area_id != null"
                color="blue-grey" 
                @click.native="setArea({'id': fields.area_id, 'area_name': fields.area_name})"
                size="sm">
                <mdb-icon icon="chevron-right"/>
                </mdb-btn>
            </mdb-card-body>

            <!-- PLACE -->
            <mdb-card-body 
            v-else-if="step === 'place'"
            >
                
                <mdb-input type="textarea" label="Beskrivning av plats" v-model="fields.place" :rows="5"/>
                
                <mdb-btn color="blue-grey" @click.native="stepBackFromPlace()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn color="blue-grey" @click.native="setPlace()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
            </mdb-card-body>

            <!-- KILLDATE -->
            <mdb-card-body 
            v-else-if="step === 'killdate'"
            >
                <mdb-input type="date" label="Datum" v-model="fields.killdate" @change="checkKilldate" />
                <p v-if="wrongkilldate" style="font-size:12px; color:red;">Kan inte sätta ett framtida datum.</p>
                <mdb-btn color="blue-grey" @click.native="stepBackFromKilldate()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="killdateset"
                color="blue-grey" 
                @click.native="setKilldate()"
                size="sm">
                    <mdb-icon icon="chevron-right"/>
                </mdb-btn>
                
            </mdb-card-body>
            

            <mdb-card-body 
            v-else-if="step === 'species'"
            >
                <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.species == 'Älg' ? 'indigo' : 'grey'" @click="setSpecies('Älg')">Älg</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.species == 'Kronvilt' ? 'indigo' : 'grey'" @click="setSpecies('Kronvilt')">Kronvilt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.species == 'Dovvilt' ? 'indigo' : 'grey'" @click="setSpecies('Dovvilt')">Dovvilt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.species == 'Rådjur' ? 'indigo' : 'grey'" @click="setSpecies('Rådjur')">Rådjur</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="fields.species == 'Vildsvin' ? 'indigo' : 'grey'" @click="setSpecies('Vildsvin')">Vildsvin</mdb-btn></div>
                </div>
                <mdb-btn color="blue-grey" @click.native="stepBackFromSpecies()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="fields.species != null"
                color="blue-grey" 
                @click.native="setSpecies(fields.species)"
                size="sm">
                <mdb-icon icon="chevron-right"/>
                </mdb-btn>
          </mdb-card-body>
        
            <mdb-card-body 
            v-else-if="step === 'speciestype'"
            >
            <!-- <mdb-btn-group> -->
                <div
                v-if="fields.species == 'Älg'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Tjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Tjur')" class='w-100 m-0 mb-1'>Tjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Ko' ? 'indigo' : 'grey'" @click="setSpeciesType('Ko')" class='w-100 m-0 mb-1'>Ko</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Kviga' ? 'indigo' : 'grey'" @click="setSpeciesType('Kviga')" class='w-100 m-0 mb-1'>Kviga</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Kvigkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Kvigkalv')" class='w-100 m-0 mb-1'>Kvigkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämd kalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kalv')" class='w-100 m-0 mb-1'>Obestämd kalv</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="fields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(fields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                </div>
                <div
                v-else-if="krondov(fields.species)"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Hjort' ? 'indigo' : 'grey'" @click="setSpeciesType('Hjort')" class='w-100 m-0 mb-1'>Hjort</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Hind' ? 'indigo' : 'grey'" @click="setSpeciesType('Hind')" class='w-100 m-0 mb-1'>Hind</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Smalhind' ? 'indigo' : 'grey'" @click="setSpeciesType('Smalhind')" class='w-100 m-0 mb-1'>Smalhind</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Hjortkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Hjortkalv')" class='w-100 m-0 mb-1'>Hjortkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Hindkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Hindkalv')" class='w-100 m-0 mb-1'>Hindkalv</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="fields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(fields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                </div>
                <div
                v-else-if="fields.species == 'Rådjur'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Bock' ? 'indigo' : 'grey'" @click="setSpeciesType('Bock')" class='w-100 m-0 mb-1'>Bock</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Get' ? 'indigo' : 'grey'" @click="setSpeciesType('Get')" class='w-100 m-0 mb-1'>Get</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Smaldjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Smaldjur')" class='w-100 m-0 mb-1'>Smaldjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Bockkilling' ? 'indigo' : 'grey'" @click="setSpeciesType('Bockkilling')" class='w-100 m-0 mb-1'>Bockkilling</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Getkilling' ? 'indigo' : 'grey'" @click="setSpeciesType('Getkilling')" class='w-100 m-0 mb-1'>Getkilling</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämd killing' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd killing')" class='w-100 m-0 mb-1'>Obestämd killing</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="fields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(fields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                </mdb-btn>
                </div>
                <div
                v-else-if="fields.species == 'Vildsvin'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Galt' ? 'indigo' : 'grey'" @click="setSpeciesType('Galt')" class='w-100 m-0 mb-1'>Galt</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Sugga' ? 'indigo' : 'grey'" @click="setSpeciesType('Sugga')" class='w-100 m-0 mb-1'>Sugga</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Gylta' ? 'indigo' : 'grey'" @click="setSpeciesType('Gylta')" class='w-100 m-0 mb-1'>Gylta</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Galtkulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Galtkulting')" class='w-100 m-0 mb-1'>Galtkulting</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Suggkulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Suggkulting')" class='w-100 m-0 mb-1'>Suggkulting</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="fields.speciestype == 'Obestämd kulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kulting')" class='w-100 m-0 mb-1'>Obestämd kulting</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="fields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(fields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                </div>
           </mdb-card-body>

            <!-- POINTS -->
           <mdb-card-body 
            v-else-if="step === 'points'"
            >
                <mdb-input type="number" label="Antal taggar" v-model="fields.points" />
                <mdb-btn color="blue-grey" @click.native="stepBackFromPoints()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn color="blue-grey" @click.native="setPoints()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
                <!-- <mdb-btn
                v-if="isValidPoints()"
                color="blue-grey" 
                @click.native="setPoints()"
                size="sm">
                    <mdb-icon icon="chevron-right"/>
                </mdb-btn>    -->
          </mdb-card-body>

            <!-- ANTLERS -->
           <mdb-card-body 
            v-else-if="step === 'antlers'"
            >
                <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn color="grey" @click="setAntlers('Spets')" class='w-100 m-0 mb-1'>Spets</mdb-btn></div>
                    <div class="p-0"><mdb-btn color="grey" @click="setAntlers('Stång')" class='w-100 m-0 mb-1'>Stång</mdb-btn></div>
                    <div class="p-0"><mdb-btn color="grey" @click="setAntlers('Stång/Halvskovel')" class='w-100 m-0 mb-1'>Stång/Halvskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn color="grey" @click="setAntlers('Halvskovel')" class='w-100 m-0 mb-1'>Halvskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn color="grey" @click="setAntlers('Halvskovel/Helskovel')" class='w-100 m-0 mb-1'>Halvskovel/Helskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn color="grey" @click="setAntlers('Helskovel')" class='w-100 m-0 mb-1'>Helskovel</mdb-btn></div>
                </div>
            <mdb-btn color="blue-grey" @click.native="stepBackFromAntlers()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
            <mdb-btn color="blue-grey" @click.native="setAntlers()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
          </mdb-card-body>


        </mdb-card>
        <mdb-card
        v-if="card === 'report'"
        >
            <mdb-card-body >
                <form @submit.prevent="submitForm">
                    <mdb-input label="Rapportör" v-model="fields.reporter_name" disabled />
                    <mdb-input label="Skytt" v-model="fields.shooter_name" disabled />
                    <mdb-input label="Sorts jakt" v-model="fields.kindofhunt" disabled />
                    <mdb-input  label="Område" v-model="fields.area_name" disabled />
                    <mdb-input v-if="fields.place != null" type="textarea" label="Plats" v-model="fields.place" disabled />
                    <mdb-input class="mt-5" type="date" label="Datum" v-model="fields.killdate" disabled />
                    <mdb-input label="Djur" v-model="fields.species" disabled />
                    <mdb-input label="Djurklassificering" v-model="fields.speciestype" disabled />
                    <mdb-input v-if="fields.points != null" label="Taggar" v-model="fields.points" disabled />
                    <mdb-input v-if="fields.antlers != null" label="Horn" v-model="fields.antlers" disabled />
                    <input type="hidden" name="_token" :value="csrf">
                    <div class="text-center">
                        <mdb-btn :disabled="!checkFinished()" color="mdb-color" type="submit"><mdb-icon icon="file-signature" class="ml-1"/> - Skapa</mdb-btn>
                    </div>

                </form>
          </mdb-card-body>
        </mdb-card>
    </div>
</template>
<script>
  import { mdbBtn, mdbBtnGroup, mdbDropdown, mdbDropdownItem, mdbDropdownMenu, mdbDropdownToggle, mdbCard, mdbCardBody, mdbCardTitle, mdbCardText, mdbRow, mdbCol, mdbBadge, mdbInput, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbIcon } from 'mdbvue';
  export default {
    name: 'killreport',
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
      mdbIcon
    },
    props: [
            'authUser',
            'hunters',
            'accountPage',
            'areas'
        ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            fields: {
                reporter_name: this.authUser.firstname + " " + this.authUser.lastname,
                reporter_id: this.authUser.id,
                shooter_id: null,
                shooter_name: null,
                kindofhunt: null,
                animal_id: null,
                killdate: null,
                season: null,
                area_id: null,
                area_name: null,
                place: null,
                report_status: 'green',
                locked: 'no',
                species: null,
                speciestype: null,
                engspecies: null,
                sex: null,
                antlers: null,
                points: null,
            },
            step: 'shooter',
            steptitle: 'SKYTT',
            formersteptitle: "",
            card: 'questions',
            activeQ: true,
            activeR: false,
            confirmModal: false,
            backToUserModal: false,
            wrongkilldate: false,
            killdateset: false,
        }

    },
    mounted() {
        console.log(this.hunters);
        console.log(this.accountPage);
        console.log(this.areas);
    },
    methods: {
        krondov(s) {
            let isKronvilt, isDovvilt;
            isKronvilt = (s === "Kronvilt");
            isDovvilt = (s === "Dovvilt");
            console.log("species: " + s);
            console.log("isKronvilt: " + isKronvilt);
            console.log("isDovvilt: " + isDovvilt);
            console.log("krondov: " + s == "Kronvilt" || s == "Dovvilt");
            this.kron = ((s === "Kronvilt") || (s === "Dovvilt"));
            return isKronvilt || isDovvilt;
        },
        setShooter(hunter) {
            this.fields.shooter_id = hunter.id;
            this.fields.shooter_name = hunter.firstname + " " + hunter.lastname;
            this.step = 'kindofhunt';
            this.steptitle = 'SORTS JAKT';
        },
        setKindOfHunt(value) {
            this.fields.kindofhunt = value;
            this.step = 'area';
            this.steptitle = "OMRÅDE";
        },
        stepBackFromKindOfHunt() {
            this.fields.kindofhunt = null;
            this.step = 'shooter';
            this.steptitle = "SKYTT";
        },
        setArea(area) {
            this.fields.area_id = area.id;
            this.fields.area_name = area.area_name;
            this.step = "place";
            this.steptitle = "PLATS";
        },
        stepBackFromAreas() {
            this.fields.area_id = null;
            this.fields.area_name = null;
            this.step = 'kindofhunt';
            this.steptitle = "SORTS JAKT";
        },
        setPlace() {
            if(this.fields.place != null) {
                if(this.fields.place == "") {
                    this.fields.place = null;
                }
            }
            this.step = "killdate";
            this.steptitle = "DATUM";
        },
        stepBackFromPlace() {
            this.fields.place = null;
            this.step = "area";
            this.steptitle = "OMRÅDE";
        },
        checkKilldate() {
            let thenow = Date.now();
            let thekilldate = new Date(this.fields.killdate);
            if(thekilldate >= thenow) {
                this.wrongkilldate = true;
                this.killdateset = false;
            } else {
                this.wrongkilldate = false;
                this.killdateset = true;
            }
            console.log(this.fields.killdate);
            if(this.fields.killdate == "") {
                this.wrongkilldate = false;
                this.killdateset = false;
            }
            
        },
        setKilldate() {
            this.step = 'species';
            this.steptitle = "DJUR"
        },
        stepBackFromKilldate() {
            this.fields.killdate = null;
            this.step = "place";
            this.steptitle = "PLATS";
            this.wrongkilldate = false;
            this.killdateset = false;
        },
        setSpecies(value) {
            this.fields.species = value;
            this.step = 'speciestype';
            this.steptitle = 'DJURKLASSIFICERING';
        },
        stepBackFromSpecies() {
            this.step = 'killdate';
            this.steptitle = "DATUM";
            this.fields.species = null;
        },
        setSpeciesType(value) {
            this.fields.speciestype = value;
            
            if (this.points()) {
                this.step = 'points';
                this.steptitle = "TAGGAR";
            } else if (this.antlers()) {
                this.step = 'antlers';
                this.steptitle = "HORN";
            } else {
                this.toggleActiveStateR();

            }
        },
        stepBackFromSpeciesType() {
            this.step = 'species';
            this.steptitle = "DJUR";
            this.fields.speciestype = null;
        },
        setPoints() {
            this.toggleActiveStateR();
        },
        isValidPoints() {
            let isValid = false;
            if(this.fields.points != null) {
                this.fields.points = parseInt(this.fields.points);
                isValid = Number.isInteger(parseInt(this.fields.points));
                isValid = this.fields.points > 0;
                
            }
            return isValid;
        },
        points() {
            let isTjur = this.fields.speciestype == 'Tjur';
            let isKronvilt = this.fields.species == "Kronvilt";
            let isHjort = this.fields.speciestype == "Hjort";
            let isKronviltHjort = (isKronvilt && isHjort);
            console.log("POINTS:")
            console.log((isTjur || isKronviltHjort))
            return (isTjur || isKronviltHjort);
        },
        stepBackFromPoints() {
            this.step = 'speciestype';
            this.steptitle = "DJURKVALIFICERING";
            this.fields.points = null;
            this.notfinished = true;
        },
        antlers() {
            let isDovvilt = this.fields.species == "Dovvilt";
            let isHjort = this.fields.speciestype == "Hjort";
            let isDovviltHjort = (isDovvilt && isHjort);
            console.log("HORN:")
            console.log(isDovviltHjort)
            return isDovviltHjort;
        },
        setAntlers(value){
            this.fields.antlers = value;
            this.toggleActiveStateR();

        },
        stepBackFromAntlers() {
            this.fields.antlers = null;
            this.step = "speciestype";
            this.steptitle = "DJURKVALIFICERING";

        },
        setCard(card) {
            this.card = card;
        },
        toggleActiveStateQ() {
            this.card = 'questions';
            this.activeQ = true;
            this.activeR = false;
            this.steptitle = this.formersteptitle;
        },
        toggleActiveStateR() {
            this.card = 'report';
            this.activeQ = false;
            this.activeR = true;
            this.formersteptitle = this.steptitle;
            this.steptitle = "RAPPORT"
            
        },
        checkFinished(){
            let finished = false;
            if(this.fields.speciestype == null) {
                finished = false;
            } else {
                finished = true;
            }
            return finished;
        },
        clearReportData() { 
            // Closing modal and reseting data
            this.confirmModal = false;
            this.step = 'shooter';
            this.steptitle = "SKYTT";
            this.formersteptitle = '';
            this.card = 'questions';
            this.activeQ = true;
            this.activeR = false;
            this.confirmModal = false;

            // Reseting fields data
            this.fields.shooter_id = null;
            this.fields.shooter_name = null;
            this.fields.kindofhunt = null;
            this.fields.animal_id = null;
            this.fields.killdate = null;
            this.fields.season = null;
            this.fields.area_id = null;
            this.fields.area_name = null;
            this.fields.place = null;
            this.fields.report_status = 'green';
            this.fields.locked = 'no';
            this.fields.species = null;
            this.fields.speciestype = null;
            this.fields.engspecies = null;
            this.fields.sex = null;
            this.fields.antlers = null;
            this.fields.points = null;
        },
        cancelReportProcess() {
            window.location = this.accountPage;
        }

    }
  }
</script>