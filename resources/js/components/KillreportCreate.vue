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


        <!-- MODAL FÖR RENSA DATA -->
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

        <!-- MODAL FÖR ATT GÅ TILL 'MIN SIDA' -->
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
                    <div class="d-flex justify-content-center">
                        <mdb-btn
                        color="blue-grey" 
                        @click.native="setAnonShooter()"
                        size="sm">
                        Vänta med att sätta skytt <mdb-icon icon="chevron-right"/>
                        </mdb-btn>
                    </div>
                    <div
                    v-for="hunter in hunters"
                    :key="hunter.id"
                    >   
                        <div class="d-flex justify-content-center">
                            <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                            <mdb-btn class="mb-0" style="width: 300px" :color="killreportfields.shooter_id == hunter.id ? 'indigo' : 'grey'" @click="setShooter(hunter)" >{{hunter.firstname}} {{hunter.lastname}}</mdb-btn>
                        </div>    
                    </div>
                    
                </div>
            </mdb-card-body>

            <!-- KINDOFHUNT -->
            <mdb-card-body 
            v-else-if="step === 'kindofhunt'"
            >
                <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="killreportfields.kindofhunt == 'Ensamjakt' ? 'indigo' : 'grey'" @click="setKindOfHunt('Ensamjakt')">Ensamjakt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="killreportfields.kindofhunt == 'Gemensam jakt' ? 'indigo' : 'grey'" @click="setKindOfHunt('Gemensam jakt')">Gemensam jakt</mdb-btn></div>
                </div>
                <mdb-btn color="blue-grey" @click.native="stepBackFromKindOfHunt()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="killreportfields.kindofhunt != null"
                color="blue-grey" 
                @click.native="setKindOfHunt(killreportfields.kindofhunt)"
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
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="killreportfields.area_id == area.id ? 'indigo' : 'grey'" @click="setArea(area)">{{area.area_name}}</mdb-btn></div>
                </div>
                <mdb-btn color="blue-grey" @click.native="stepBackFromAreas()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="killreportfields.area_id != null"
                color="blue-grey" 
                @click.native="setArea({'id': killreportfields.area_id, 'area_name': area_name})"
                size="sm">
                <mdb-icon icon="chevron-right"/>
                </mdb-btn>
            </mdb-card-body>

            <!-- PLACE -->
            <mdb-card-body 
            v-else-if="step === 'place'"
            >
                
                <mdb-input type="textarea" label="Beskrivning av plats" v-model="killreportfields.place" :rows="5"/>
                
                <mdb-btn color="blue-grey" @click.native="stepBackFromPlace()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn color="blue-grey" @click.native="setPlace()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
            </mdb-card-body>

            <!-- KILLDATE -->
            <mdb-card-body 
            v-else-if="step === 'killdate'"
            >
                <mdb-input type="date" label="Datum" v-model="killreportfields.killdate" @change="checkKilldate" />
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
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="animalfields.species == 'Älg' ? 'indigo' : 'grey'" @click="setSpecies('Älg')">Älg</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="animalfields.species == 'Kronvilt' ? 'indigo' : 'grey'" @click="setSpecies('Kronvilt')">Kronvilt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="animalfields.species == 'Dovvilt' ? 'indigo' : 'grey'" @click="setSpecies('Dovvilt')">Dovvilt</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="animalfields.species == 'Rådjur' ? 'indigo' : 'grey'" @click="setSpecies('Rådjur')">Rådjur</mdb-btn></div>
                    <div class="p-0"><mdb-btn class='w-100 m-0 mb-1' :color="animalfields.species == 'Vildsvin' ? 'indigo' : 'grey'" @click="setSpecies('Vildsvin')">Vildsvin</mdb-btn></div>
                </div>
                <mdb-btn color="blue-grey" @click.native="stepBackFromSpecies()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn
                v-if="animalfields.species != null"
                color="blue-grey" 
                @click.native="setSpecies(animalfields.species)"
                size="sm">
                <mdb-icon icon="chevron-right"/>
                </mdb-btn>
          </mdb-card-body>
        
            <mdb-card-body 
            v-else-if="step === 'speciestype'"
            >
            <!-- <mdb-btn-group> -->
                <div
                v-if="animalfields.species == 'Älg'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Tjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Tjur')" class='w-100 m-0 mb-1'>Tjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Ko' ? 'indigo' : 'grey'" @click="setSpeciesType('Ko')" class='w-100 m-0 mb-1'>Ko</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Kviga' ? 'indigo' : 'grey'" @click="setSpeciesType('Kviga')" class='w-100 m-0 mb-1'>Kviga</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Tjurkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Tjurkalv')" class='w-100 m-0 mb-1'>Tjurkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Kvigkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Kvigkalv')" class='w-100 m-0 mb-1'>Kvigkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämd kalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kalv')" class='w-100 m-0 mb-1'>Obestämd kalv</mdb-btn></div>
                    </div>
                        <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="animalfields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(animalfields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                    <mdb-btn
                    v-else
                    color="blue-grey"
                    @click.native="setUnknownSpeciesType()"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                </div>
                <div
                v-else-if="krondov(animalfields.species)"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Hjort' ? 'indigo' : 'grey'" @click="setSpeciesType('Hjort')" class='w-100 m-0 mb-1'>Hjort</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Hind' ? 'indigo' : 'grey'" @click="setSpeciesType('Hind')" class='w-100 m-0 mb-1'>Hind</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Smalhind' ? 'indigo' : 'grey'" @click="setSpeciesType('Smalhind')" class='w-100 m-0 mb-1'>Smalhind</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Hjortkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Hjortkalv')" class='w-100 m-0 mb-1'>Hjortkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Hindkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Hindkalv')" class='w-100 m-0 mb-1'>Hindkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämd kalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kalv')" class='w-100 m-0 mb-1'>Obestämd kalv</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="animalfields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(animalfields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                    <mdb-btn
                    v-else
                    color="blue-grey"
                    @click.native="setUnknownSpeciesType()"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                </div>
                <div
                v-else-if="animalfields.species == 'Rådjur'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Bock' ? 'indigo' : 'grey'" @click="setSpeciesType('Bock')" class='w-100 m-0 mb-1'>Bock</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Get' ? 'indigo' : 'grey'" @click="setSpeciesType('Get')" class='w-100 m-0 mb-1'>Get</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Smaldjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Smaldjur')" class='w-100 m-0 mb-1'>Smaldjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Bockkilling' ? 'indigo' : 'grey'" @click="setSpeciesType('Bockkilling')" class='w-100 m-0 mb-1'>Bockkilling</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Getkilling' ? 'indigo' : 'grey'" @click="setSpeciesType('Getkilling')" class='w-100 m-0 mb-1'>Getkilling</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämd killing' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd killing')" class='w-100 m-0 mb-1'>Obestämd killing</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="animalfields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(animalfields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                </mdb-btn>
                <mdb-btn
                    v-else
                    color="blue-grey"
                    @click.native="setUnknownSpeciesType()"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                </div>
                <div
                v-else-if="animalfields.species == 'Vildsvin'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Galt' ? 'indigo' : 'grey'" @click="setSpeciesType('Galt')" class='w-100 m-0 mb-1'>Galt</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Sugga' ? 'indigo' : 'grey'" @click="setSpeciesType('Sugga')" class='w-100 m-0 mb-1'>Sugga</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Gylta' ? 'indigo' : 'grey'" @click="setSpeciesType('Gylta')" class='w-100 m-0 mb-1'>Gylta</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Galtkulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Galtkulting')" class='w-100 m-0 mb-1'>Galtkulting</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Suggkulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Suggkulting')" class='w-100 m-0 mb-1'>Suggkulting</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="animalfields.speciestype == 'Obestämd kulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kulting')" class='w-100 m-0 mb-1'>Obestämd kulting</mdb-btn></div>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="stepBackFromSpeciesType()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn
                    v-if="animalfields.speciestype != null"
                    color="blue-grey" 
                    @click.native="setSpeciesType(animalfields.speciestype)"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>
                    <mdb-btn
                    v-else
                    color="blue-grey"
                    @click.native="setUnknownSpeciesType()"
                    size="sm">
                    <mdb-icon icon="chevron-right"/>
                    </mdb-btn>

                </div>
           </mdb-card-body>

            <!-- POINTS -->
           <mdb-card-body 
            v-else-if="step === 'points'"
            >
                <mdb-input type="number" label="Antal taggar" v-model="animalfields.points" />
                <mdb-btn color="blue-grey" @click.native="stepBackFromPoints()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn color="blue-grey" @click.native="setPoints()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
          </mdb-card-body>

            <!-- ANTLERS -->
           <mdb-card-body 
            v-else-if="step === 'antlers'"
            >
                <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn :color="animalfields.antlers == 'Spets' ? 'indigo' : 'grey'" @click="setAntlers('Spets')" class='w-100 m-0 mb-1'>Spets</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="animalfields.antlers == 'Stång' ? 'indigo' : 'grey'" @click="setAntlers('Stång')" class='w-100 m-0 mb-1'>Stång</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="animalfields.antlers == 'Stång/Halvskovel' ? 'indigo' : 'grey'" @click="setAntlers('Stång/Halvskovel')" class='w-100 m-0 mb-1'>Stång/Halvskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="animalfields.antlers == 'Halvskovel' ? 'indigo' : 'grey'" @click="setAntlers('Halvskovel')" class='w-100 m-0 mb-1'>Halvskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="animalfields.antlers == 'Halvskovel/Helskovel' ? 'indigo' : 'grey'" @click="setAntlers('Halvskovel/Helskovel')" class='w-100 m-0 mb-1'>Halvskovel/Helskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="animalfields.antlers == 'Helskovel' ? 'indigo' : 'grey'" @click="setAntlers('Helskovel')" class='w-100 m-0 mb-1'>Helskovel</mdb-btn></div>
                </div>

            <mdb-btn color="blue-grey" @click.native="stepBackFromAntlers()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
            <mdb-btn color="blue-grey" @click.native="setAntlers()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
          </mdb-card-body>

            <!-- WEIGHT -->
           <mdb-card-body 
            v-else-if="step === 'weight'"
            >
                <div class="d-flex flex-row justify-content-around">
                    <mdb-btn color="blue-grey" @click.native="stepBackFromWeight()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn color="blue-grey" @click.native="setWeight()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
                </div>
                <div class="d-flex flex-column">
                    <div class="p-3 mb-2" style="border-left: 8px solid #9aa5bd; border-bottom: 1px solid #d0d0d0;">
                        <mdb-input type="number" step="0.1" label="Levandevikt" v-model="animalfields.live_weight"/>
                        <mdb-input type="number" step="0.1" label="Uppskattad levandevikt" v-model="animalfields.aprox_live_weight"/>
                    </div>
                    <div class="p-3 mb-2" style="border-left: 8px solid #9aa5bd; border-bottom: 1px solid #d0d0d0;">
                        <mdb-input type="number" step="0.1" label="Passad vikt" v-model="animalfields.passad_weight"/>
                        <mdb-input type="number" step="0.1" label="Uppskattad passad vikt" v-model="animalfields.aprox_passad_weight"/>
                    </div>
                    <div class="p-3 mb-2" style="border-left: 8px solid #9aa5bd; border-bottom: 1px solid #d0d0d0;">
                        <mdb-input type="number" step="0.1" label="Slaktvikt" v-model="animalfields.carcass_weight"/>
                        <mdb-input type="number" step="0.1" label="Uppskattad slaktvikt" v-model="animalfields.aprox_carcass_weight"/>
                    </div>
                    <div class="p-3 mb-2" style="border-left: 8px solid #9aa5bd; border-bottom: 1px solid #d0d0d0;">
                        <mdb-input type="number" step="0.1" label="Styckdetaljer" v-model="animalfields.cut_weight"/>
                    </div>
                    <div class="p-3 mb-2" style="border-left: 8px solid #9aa5bd; border-bottom: 1px solid #d0d0d0;">
                        <mdb-input type="number" step="0.001" label="Hjärtvikt" v-model="animalfields.heart_weight"/>
                    </div>
                </div>
                <div class="d-flex flex-row justify-content-around">
                    <mdb-btn color="blue-grey" @click.native="stepBackFromWeight()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn color="blue-grey" @click.native="setWeight()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
                </div>
          </mdb-card-body>

            <!-- meat -->
            <mdb-card-body
            v-else-if="step === 'meat'"
            >
                <div class="d-flex flex-row justify-content-around">
                    <mdb-btn color="blue-grey" @click.native="stepBackFromMeat()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <div class="custom-control custom-switch" style="width:110px">
                        <input type="checkbox" class="custom-control-input" v-model="showTotalMeat" id="customSwitches">
                        <label v-if="showTotalMeat" class="custom-control-label" for="customSwitches">Totalt</label>
                        <label v-else class="custom-control-label" for="customSwitches">Jaktsäsong</label>
                    </div>
                    <mdb-btn color="blue-grey" @click.native="setMeat()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
                </div>
                <div class="d-flex justify-content-center">
                    <mdb-btn style="width: 200px"
                    :color="isToggledForMeat(anonhunter[0].id) ? 'indigo' : 'grey'" 
                    @click.native="togglemeat(anonhunter[0].id)"
                    size="sm">
                    Gäst 
                    </mdb-btn>
                </div>
                <div v-if="this.animalfields.species == 'Älg'">
                    
                    <div v-if="showTotalMeat" class="d-flex flex-column">
                            
                        <div
                        v-for="hunter in meatMooseTotal"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                    </div>
                    <div v-else class="d-flex flex-column">
                        <div
                        v-for="hunter in meatMooseThisSeason"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                    </div>
                </div>
                <div v-if="this.animalfields.species == 'Kronvilt'">
                    <div v-if="showTotalMeat" class="d-flex flex-column">
                        <div
                        v-for="hunter in meatReddeerTotal"
                        :key="hunter.id"
                        >   
                            <div class="d-flex flex-row justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>
                        </div>
                    </div>
                    <div v-else class="d-flex flex-column">
                        <div
                        v-for="hunter in meatReddeerThisSeason"
                        :key="hunter.id"
                        >   
                            <div class="d-flex flex-row justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>
                        </div>
                        
                    </div>
                </div>
                <div v-if="this.animalfields.species == 'Dovvilt'">
                    <div v-if="showTotalMeat" class="d-flex flex-column">
                        <div
                        v-for="hunter in meatFallowdeerTotal"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                        
                    </div>
                    <div v-else class="d-flex flex-column">
                        <div
                        v-for="hunter in meatFallowdeerThisSeason"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>

                    </div>
                </div>
                <div v-if="this.animalfields.species == 'Rådjur'">
                    <div v-if="showTotalMeat" class="d-flex flex-column">
                        <div
                        v-for="hunter in meatRoedeerTotal"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                    </div>
                    <div v-else class="d-flex flex-column">
                        <div
                        v-for="hunter in meatRoedeerThisSeason"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                    </div>
                </div>
                <div v-if="this.animalfields.species == 'Vildsvin'">
                    <div v-if="showTotalMeat" class="d-flex flex-column">
                        <div
                        v-for="hunter in meatBoarTotal"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                    </div>
                    <div v-else class="d-flex flex-column">
                        <div
                        v-for="hunter in meatBoarThisSeason"
                        :key="hunter.id"
                        >   
                            <div class="d-flex justify-content-center">
                                <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter.id)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                            </div>    
                        </div>
                    </div>
                </div>

                <div class="d-flex flex-row justify-content-around">
                    <mdb-btn color="blue-grey" @click.native="stepBackFromMeat()" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                    <mdb-btn color="blue-grey" @click.native="setMeat()" size="sm"><mdb-icon icon="chevron-right"/></mdb-btn>
                </div>
            </mdb-card-body>
            <!-- /meat -->


        </mdb-card>
        <!-- /questions -->

        <mdb-card
        v-if="card === 'report'"
        >
            <mdb-card-body >
                <form @submit.prevent="submitForm">
                    <div class="w-100">
                        <h6 class="d-flex justify-content-center">VEM/VAR/NÄR/VAD</h6>
                    </div>
                    <mdb-row>
                        <div class="w-100 pl-3 ml-2 topinforeport">
                            <mdb-input label="Rapportör" v-model="reporter_name" disabled />
                            <mdb-input label="Skytt" v-model="shooter_name" disabled />
                            <mdb-input label="Sorts jakt" v-model="killreportfields.kindofhunt" disabled />
                            <mdb-input  label="Område" v-model="area_name" disabled />
                            <mdb-input v-if="killreportfields.place != null" type="textarea" label="Plats" v-model="killreportfields.place" />
                            <mdb-input class="mt-5" type="date" label="Datum" v-model="killreportfields.killdate" disabled />
                            <mdb-input label="Djur" v-model="animalfields.species" disabled />
                            <mdb-input label="Djurklassificering" v-model="animalfields.speciestype" disabled />
                            <mdb-input v-if="animalfields.points != null" label="Taggar" v-model="animalfields.points" disabled />
                            <mdb-input v-if="animalfields.antlers != null" label="Horn" v-model="animalfields.antlers" disabled />
                            <!-- <mdb-row v-if="(animalfields.live_weight != null) || animalfields.aprox_live_weight != null"> -->
                        </div>
                    </mdb-row>
                    
                    

                    <mdb-row v-if="weights()">
                        <div class="w-100">
                            <h6 class="d-flex justify-content-center">VIKTER</h6>
                        </div>
                    </mdb-row>
                    
                    <mdb-row v-if="(animalfields.live_weight != null) || animalfields.aprox_live_weight != null">
                        <div class="w-100 ml-2 mr-4 mb-2 weightreport">
                            <mdb-col>
                                <mdb-input label="Levandevikt" v-model="animalfields.live_weight" disabled/>
                            </mdb-col>
                            <mdb-col>
                                <mdb-input label="Uppskattad levandevikt" v-model="animalfields.aprox_live_weight" disabled/>
                            </mdb-col>
                        </div>   
                    </mdb-row>

                    <mdb-row v-if="(animalfields.passad_weight != null) || animalfields.aprox_passad_weight != null">
                        <div class="w-100 ml-2 mr-4 mb-2 weightreport">
                            <mdb-col>
                                <mdb-input label="Passad vikt" v-model="animalfields.passad_weight" disabled/>
                            </mdb-col>
                            <mdb-col>
                                <mdb-input label="Uppskattad passad vikt" v-model="animalfields.aprox_passad_weight" disabled/>
                            </mdb-col>
                        </div>   
                    </mdb-row>

                    <mdb-row v-if="(animalfields.carcass_weight != null) || animalfields.aprox_carcass_weight != null">
                        <div class="w-100 ml-2 mr-4 mb-2 weightreport">
                            <mdb-col>
                                <mdb-input label="Slaktvikt" v-model="animalfields.carcass_weight" disabled/>
                            </mdb-col>
                            <mdb-col>
                                <mdb-input label="Uppskattad slaktvikt" v-model="animalfields.aprox_carcass_weight" disabled/>
                            </mdb-col>
                        </div>   
                    </mdb-row>

                    <mdb-row v-if="(animalfields.cut_weight != null) || animalfields.heart_weight != null">
                        <div class="w-100 ml-2 mr-4 mb-2 weightreport">
                            <mdb-col>
                                <mdb-input label="Styckdetaljer" v-model="animalfields.cut_weight" disabled/>
                            </mdb-col>
                            <mdb-col>
                                <mdb-input label="Hjärtvikt" v-model="animalfields.heart_weight" disabled/>
                            </mdb-col>
                        </div>   
                    </mdb-row>

                    <mdb-row v-if="toggledformeat.length > 0">
                        <div class="w-100">
                            <h6 class="d-flex justify-content-center">KÖTT TILLDELAS</h6>
                        </div>
                        <div class="w-100 ml-2 mr-4 mb-2 meatreport">
                            <div v-for="id in toggledformeat" :key="id">
                                <div class="ml-2 mt-2 mb-2">{{ huntername(id) }} {{ share_kilogram }} kg</div>    
                            </div>
                        </div>
                    </mdb-row>

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
  import { mdbBtn, mdbBtnGroup, mdbDropdown, mdbDropdownItem, mdbDropdownMenu, mdbDropdownToggle, mdbCard, mdbCardBody, mdbCardTitle, mdbCardText, mdbRow, mdbCol, mdbBadge, mdbInput, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbIcon, mdbCardImage } from 'mdbvue';
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
      mdbIcon,
      mdbCardImage
    },
    props: [
            'authUser',
            'hunters',
            'anonhunter',
            'accountPage',
            'areas',
            'meats',
            'meatMooseTotal',
            'meatReddeerTotal',
            'meatFallowdeerTotal',
            'meatRoedeerTotal',
            'meatBoarTotal',
            'meatMooseThisSeason',
            'meatReddeerThisSeason',
            'meatFallowdeerThisSeason',
            'meatRoedeerThisSeason',
            'meatBoarThisSeason',
            'animalUrl',
            'killreportUrl',
            'killreportIndexUrl',
            'meatUrl'
        ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            animalfields: {
                shooter_id: null,
                species: null,
                speciestype: null,
                engspecies: null,
                age: null,
                sex: null,
                antlers: null,
                points: null,
                live_weight: null,
                aprox_live_weight: null,
                passad_weight: null,
                aprox_passad_weight: null,
                carcass_weight: null,
                aprox_carcass_weight: null,
                cut_weight: null,
                heart_weight: null,
            },
            killreportfields: {
                
                reporter_id: this.authUser.id,
                shooter_id: null,
                
                kindofhunt: null,
                killdate: this.todaysdate(),
                season: null,
                animal_id: null,
                area_id: null,
                image: 'default.png',
                place: null,
                report_status: 'green',
                locked: 'no',
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
            reporter_name: this.authUser.firstname + " " + this.authUser.lastname,
            shooter_name: null,
            area_name: null,
            thekilldate: null,
            toggledformeat: [],
            showTotalMeat: false,
            share_kilogram: null
        }

    },
    mounted() {
        console.log(this.hunters);
        console.log("Anonhunter.id:")
        console.log(this.anonhunter[0].id);
        console.log("Anonhunter:")
        console.log(this.anonhunter);
        console.log(this.accountPage);
        console.log(this.areas);
        console.log(this.animalUrl);
        console.log(this.killreportUrl);
        console.log("this.killreportIndexUrl: " + this.killreportIndexUrl);
        console.log();
        console.log('meats:');
        console.log(this.meats);
        console.log('meatUrl:');
        console.log(this.meatUrl);

        let sortedMooseTotal = this.bubble(this.meatMooseTotal);
        let sortedReddeerTotal = this.bubble(this.meatReddeerTotal);
        let sortedFallowdeerTotal = this.bubble(this.meatFallowdeerTotal);
        let sortedRoedeerTotal = this.bubble(this.meatRoedeerTotal);
        let sortedBoarTotal = this.bubble(this.meatBoarTotal);

        let sortedMooseThisSeason = this.bubble(this.meatMooseThisSeason);
        let sortedReddeerThisSeason = this.bubble(this.meatReddeerThisSeason);
        let sortedFallowdeerThisSeason = this.bubble(this.meatFallowdeerThisSeason);
        let sortedRoedeerThisSeason = this.bubble(this.meatRoedeerThisSeason);
        let sortedBoarThisSeason = this.bubble(this.meatBoarThisSeason);


        console.log('meatMooseTotal:');
        console.log(this.meatMooseTotal);
        console.log('meatReddeerTotal:');
        console.log(this.meatReddeerTotal);
        console.log('meatFallowdeerTotal:');
        console.log(this.meatFallowdeerTotal);
        console.log('meatRoedeerTotal:');
        console.log(this.meatRoedeerTotal);
        console.log('meatBoarTotal:');
        console.log(this.meatBoarTotal);


    },
    methods: {
        huntername(_id) {
            // console.log(_id);
            let res = ""
            var user = this.hunters.filter(obj => {
                return obj.id === _id;
            });
            if(_id != this.anonhunter[0].id) {
                res = user[0].firstname +" "+ user[0].lastname;
            } else {
                res = "Gäst";
            }
            return res
        },
        togglemeat(id) {
            console.log("Togglar id " + id);
            if (this.toggledformeat.includes(id)) {
                let index = this.toggledformeat.indexOf(id);
                this.toggledformeat.splice(index, 1);
            } else {
                this.toggledformeat.push(id);
            }
        },
        isToggledForMeat(id) {
            let result = false;
            if (this.toggledformeat.includes(id)) {
                result = true;
            } 
            return result;
        },
        getShareKilo() {
            // console.log("Kommer hit till getShareKilo");
            let share_kilo = 0;
            // console.log("this.animalfields.carcass_weight");
            // console.log(this.animalfields.carcass_weight);
            // console.log("this.animalfields.aprox_carcass_weight");
            // console.log(this.animalfields.aprox_carcass_weight);
            if(this.animalfields.carcass_weight != null) {
                share_kilo = this.animalfields.carcass_weight/this.toggledformeat.length;
            } else if(this.animalfields.aprox_carcass_weight != null) {
                share_kilo = this.animalfields.aprox_carcass_weight/this.toggledformeat.length;
            }

            // console.log("getShareKilo->share_kilo");
            // console.log(share_kilo);
            return share_kilo;
        },
        bubble(obj_unsorted) {
            let bubbling = true;
            let notswapped = true;
            // let objarr = [];
            let obj = obj_unsorted;
            let n = Object.keys(obj).length - 1;
            // console.log('n');
            // console.log(n);
            // let c = 0;
            // console.log('obj');
            // console.log(obj);
            while (bubbling) {
                notswapped = true;
                for (var k=0; k < n; k++) {
                    // console.log("KOMMER HIT")
                    // console.log('obj[k].kg');
                    // console.log(obj[k].kg);
                    // console.log('obj[k+1].kg');
                    // console.log(obj[k+1].kg);
                    if (obj[k].kg > obj[k+1].kg) {
                        var temp = obj[k];
                        // console.log(temp);
                        // console.log('temp');
                        obj[k] = obj[k+1];
                        obj[k+1] = temp;
                        notswapped = false;
                    }
                }
                if (notswapped) {
                    bubbling = false;
                }
                // c += 1;
                // if (c > 1000000) {
                //     bubbling = false;
                // }
            }
            return obj;
        },
        todaysdate(){
            var d = new Date(),
            month = '' + (d.getMonth() + 1),
            day = '' + d.getDate(),
            year = d.getFullYear();

            if (month.length < 2) 
                month = '0' + month;
            if (day.length < 2) 
                day = '0' + day;

            return [year, month, day].join('-');

        },
        gravatarSrc(email) {
            // 404: do not load any image if none is associated with the email hash, instead return an HTTP 404 (File Not Found) response
            // mp: (mystery-person) a simple, cartoon-style silhouetted outline of a person (does not vary by email hash)
            // identicon: a geometric pattern based on an email hash
            // monsterid: a generated 'monster' with different colors, faces, etc
            // wavatar: generated faces with differing features and backgrounds
            // retro: awesome generated, 8-bit arcade-style pixelated faces
            // robohash: a generated robot with different colors, faces, etc
            // blank: a transparent PNG image (border added to HTML below for demonstration purposes)
            let md5 = require('md5');
            let g_email;
            g_email = "https://www.gravatar.com/avatar/" + md5(email)+"?d=monsterid&s=60";
            console.log(g_email);
            return g_email;
            // return "https://www.gravatar.com/avatar/" + md5(email)+"?d=monsterid&s=60";
        },
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
            this.killreportfields.shooter_id = hunter.id;
            this.animalfields.shooter_id = hunter.id;
            this.shooter_name = hunter.firstname + " " + hunter.lastname;
            this.step = 'kindofhunt';
            this.steptitle = 'SORTS JAKT';
        },
        setAnonShooter() {
            this.killreportfields.shooter_id = this.anonhunter[0].id;
            this.animalfields.shooter_id = this.anonhunter[0].id;
            this.shooter_name = "Skytt ej satt";
            this.step = 'kindofhunt';
            this.steptitle = 'SORTS JAKT';
        },
        setKindOfHunt(value) {
            this.killreportfields.kindofhunt = value;
            this.step = 'area';
            this.steptitle = "OMRÅDE";
        },
        stepBackFromKindOfHunt() {
            this.killreportfields.kindofhunt = null;
            this.step = 'shooter';
            this.steptitle = "SKYTT";
        },
        setArea(area) {
            this.killreportfields.area_id = area.id;
            this.area_name = area.area_name;
            this.step = "place";
            this.steptitle = "PLATS";
        },
        stepBackFromAreas() {
            this.killreportfields.area_id = null;
            this.area_name = null;
            this.step = 'kindofhunt';
            this.steptitle = "SORTS JAKT";
        },
        setPlace() {
            if(this.killreportfields.place != null) {
                if(this.killreportfields.place == "") {
                    this.killreportfields.place = null;
                }
            }
            this.step = "killdate";
            this.steptitle = "DATUM";
            
        },
        stepBackFromPlace() {
            this.killreportfields.place = null;
            this.step = "area";
            this.steptitle = "OMRÅDE";
        },
        checkKilldate() {
            let thenow = Date.now();
            this.thekilldate = new Date(this.killreportfields.killdate);
            if(this.thekilldate >= thenow) {
                this.wrongkilldate = true;
                this.killdateset = false;
            } else {
                this.wrongkilldate = false;
                this.killdateset = true;
            }
            if(this.killreportfields.killdate == "" || this.killreportfields.killdate == null) {
                this.wrongkilldate = false;
                this.killdateset = false;
            }
            
        },
        setKilldate() {
            console.log("this.killreportfields.killdate: " + this.killreportfields.killdate);
            console.log("this.killdateset: " + this.killdateset);
            if(this.killreportfields.killdate != null) {
                this.step = 'species';
                this.steptitle = "DJUR";
                this.killreportfields.season = this.setSeason(this.killreportfields.killdate);
            }
                
        },
        stepBackFromKilldate() {
            this.killreportfields.killdate = null;
            this.step = "place";
            this.steptitle = "PLATS";
            this.wrongkilldate = false;
            this.killdateset = false;
        },
        setSeason(date) {
            let firstyear, lastyear, season;
            let year = parseInt(date.substring(2, 4));
            let month = parseInt(date.substring(5, 7));
            console.log("year: " + year);
            console.log("month: " + month);
            season = "";
            if (month < 7) {
                firstyear = (year - 1).toString();
                lastyear = year.toString();
            } else {
                firstyear = year.toString();
                lastyear = (year + 1).toString();
            }
            season = firstyear+"/"+lastyear;
            return season;
        },
        setSpecies(value) {
            this.animalfields.species = value;
            this.animalfields.engspecies = null;

            if (value == 'Älg') {
                this.animalfields.engspecies = 'moose';
            } else if (value == 'Kronvilt') {
                this.animalfields.engspecies = 'reddeer';
            } else if (value == 'Dovvilt') {
                this.animalfields.engspecies = 'fallowdeer';
            } else if (value == 'Rådjur') {
                this.animalfields.engspecies = 'roedeer';
            } else if (value == 'Vildsvin') {
                this.animalfields.engspecies = 'boar';
            }

            this.step = 'speciestype';
            this.steptitle = 'DJURKLASSIFICERING';
        },
        stepBackFromSpecies() {
            this.step = 'killdate';
            this.steptitle = "DATUM";
            this.animalfields.species = null;
        },
        setSpeciesType(value) {
            this.animalfields.speciestype = value;
            this.animalfields.age = null;
            this.animalfields.sex = null;

            if (value == 'Tjur' || value == 'Ko' || value == 'Kviga') {
                this.animalfields.age = 'adult';
            } else if (value == 'Hjort' || value == 'Hind' || value == 'Smalhind'){
                this.animalfields.age = 'adult';
            } else if (value == 'Bock' || value == 'Get' || value == 'Smaldjur'){
                this.animalfields.age = 'adult';
            } else if (value == 'Galt' || value == 'Sugga' || value == 'Gylta'){
                this.animalfields.age = 'adult';
            } else if (value == 'Obestämt vuxet hondjur') {
                this.animalfields.age = 'adult';
            } else {
                this.animalfields.age = 'calf';
            }


            if (value == 'Tjur' || value == 'Tjurkalv') {
                this.animalfields.sex = 'male';
            } else if (value == 'Ko' || value == 'Kviga' || value == 'Kvigkalv') {
                this.animalfields.sex = 'female';
            } else if (value == 'Hjort' || value == 'Hjortkalv') {
                this.animalfields.sex = 'male';
            } else if (value == 'Hind' || value == 'Smalhind' || value == 'Hindkalv') {
                this.animalfields.sex = 'female';
            } else if (value == 'Bock' || value == 'Bockkilling') {
                this.animalfields.sex = 'male';
            } else if (value == 'Get' || value == 'Smaldjur' || value == 'Getkilling') {
                this.animalfields.sex = 'female';
            } else if (value == 'Galt' || value == 'Galtkulting') {
                this.animalfields.sex = 'male';
            } else if (value == 'Sugga' || value == 'Gylta' || value == 'Suggkulting') {
                this.animalfields.sex = 'female';
            } else if (value == 'Obestämt vuxet hondjur') {
                this.animalfields.sex = 'female';
            }

            
            if (this.points()) {
                this.step = 'points';
                this.steptitle = "TAGGAR";
            } else if (this.antlers()) {
                this.step = 'antlers';
                this.steptitle = "HORN";
            } else {
                this.step = 'weight';
                this.steptitle = 'VIKTER';
                // this.toggleActiveStateR();
            }
        },
        setUnknownSpeciesType() {
            this.animalfields.speciestype = 'unknown'
            this.animalfields.sex = 'unknown';
            if (this.points()) {
                this.step = 'points';
                this.steptitle = "TAGGAR";
            } else if (this.antlers()) {
                this.step = 'antlers';
                this.steptitle = "HORN";
            } else {
                this.step = 'weight';
                this.steptitle = 'VIKTER';
                // this.toggleActiveStateR();
            }
        },
        stepBackFromSpeciesType() {
            this.step = 'species';
            this.steptitle = "DJUR";
            this.animalfields.speciestype = null;
        },
        setPoints() {
            this.step = 'weight';
            this.steptitle = 'VIKTER';
            // this.toggleActiveStateR();
        },
        isValidPoints() {
            let isValid = false;
            if(this.animalfields.points != null) {
                this.animalfields.points = parseInt(this.animalfields.points);
                isValid = Number.isInteger(parseInt(this.animalfields.points));
                isValid = this.animalfields.points > 0;
                
            }
            return isValid;
        },
        points() {
            let isTjur = this.animalfields.speciestype == 'Tjur';
            let isKronvilt = this.animalfields.species == "Kronvilt";
            let isHjort = this.animalfields.speciestype == "Hjort";
            let isKronviltHjort = (isKronvilt && isHjort);
            console.log("POINTS:")
            console.log((isTjur || isKronviltHjort))
            return (isTjur || isKronviltHjort);
        },
        stepBackFromPoints() {
            this.animalfields.points = null;
            this.step = 'speciestype';
            this.steptitle = "DJURKVALIFICERING";
            this.notfinished = true;
            console.log("points: ", this.animalfields.points);
        },
        antlers() {
            let isDovvilt = this.animalfields.species == "Dovvilt";
            let isHjort = this.animalfields.speciestype == "Hjort";
            let isDovviltHjort = (isDovvilt && isHjort);
            console.log("HORN:")
            console.log(isDovviltHjort)
            return isDovviltHjort;
        },
        setAntlers(value){
            this.animalfields.antlers = value;
            this.step = 'weight';
            this.steptitle = 'VIKTER';
            // this.toggleActiveStateR();

        },
        stepBackFromAntlers() {
            this.animalfields.antlers = null;
            this.step = "speciestype";
            this.steptitle = "DJURKVALIFICERING";
            console.log("antlers: ", this.animalfields.antlers);
        },
        // checkNull(list) {
        //     list.forEach(element => {
        //         if(element != null) {
        //             if(element == "") {
        //                 element = null;
        //             }
        //         }
        //     })
        // },
        setWeight() {
            this.animalfields.live_weight = ((this.animalfields.live_weight == 0 || this.animalfields.live_weight == "") ? null : this.animalfields.live_weight);
            this.animalfields.aprox_live_weight = ((this.animalfields.aprox_live_weight == 0 || this.animalfields.aprox_live_weight == "") ? null : this.animalfields.aprox_live_weight);
            this.animalfields.passad_weight = ((this.animalfields.passad_weight == 0 || this.animalfields.passad_weight == "") ? null : this.animalfields.passad_weight);
            this.animalfields.aprox_passad_weight = ((this.animalfields.aprox_passad_weight == 0 || this.animalfields.aprox_passad_weight == "") ? null : this.animalfields.aprox_passad_weight);
            this.animalfields.carcass_weight = ((this.animalfields.carcass_weight == 0 || this.animalfields.carcass_weight == "") ? null : this.animalfields.carcass_weight);
            this.animalfields.aprox_carcass_weight = ((this.animalfields.aprox_carcass_weight == 0 || this.animalfields.aprox_carcass_weight == "") ? null : this.animalfields.aprox_carcass_weight);
            this.animalfields.cut_weight = ((this.animalfields.cut_weight == 0 || this.animalfields.cut_weight == "") ? null : this.animalfields.cut_weight);
            this.animalfields.heart_weight = ((this.animalfields.heart_weight == 0 || this.animalfields.heart_weight == "") ? null : this.animalfields.heart_weight);
            
            this.step = "meat";
            this.steptitle = "TILLDELNING AV KÖTT - " + this.animalfields.species.toUpperCase();;
        },
        stepBackFromWeight() {
            this.animalfields.live_weight = null;
            this.animalfields.aprox_live_weight = null;
            this.animalfields.passad_weight = null;
            this.animalfields.aprox_passad_weight = null;
            this.animalfields.carcass_weight = null;
            this.animalfields.aprox_carcass_weight = null;
            this.animalfields.cut_weight = null;
            this.animalfields.heart_weight = null;
            if(this.points()){
                this.step = 'points';
                this.steptitle = "TAGGAR";
            }else if(this.antlers()){
                this.step = 'antlers';
                this.steptitle = "HORN";
            }else{
                this.step = 'speciestype';
                this.steptitle = "DJURKVALIFICERING";
            }
            
        },
        stepBackFromMeat() {
            // TODO nollställ meat här
            this.step = 'weight';
            this.steptitle = 'VIKTER';
            this.toggledformeat = [];

        },
        setMeat() {
            this.toggleActiveStateR();
        },
        weights() {
            let isLiveWeight = this.animalfields.live_weight != null;
            let isAproxLiveWeight = this.animalfields.aprox_live_weight != null;

            let isPassadWeight = this.animalfields.passad_weight != null;
            let isAproxPassadWeight = this.animalfields.aprox_passad_weight != null;

            let isCarcassWeight = this.animalfields.carcass_weight != null;
            let isAproxCarcassWeight = this.animalfields.aprox_carcass_weight != null;

            let isCutWeight = this.animalfields.cut_weight != null;
            let isHeartWeight = this.animalfields.heart_weight != null;

            let weights = (isLiveWeight || isAproxLiveWeight || isPassadWeight || isAproxPassadWeight || isCarcassWeight || isAproxCarcassWeight || isCutWeight || isHeartWeight);

            return weights;
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

            this.share_kilogram = (this.toggledformeat.length > 0) ? this.getShareKilo() : 0;
            // console.log("this.toggledformeat.length");
            // console.log(this.toggledformeat.length);
            // console.log("share_kilogram:");
            // console.log(this.share_kilogram);
            
        },
        checkFinished(){
            let finished = false;
            if(this.animalfields.speciestype == null) {
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
            this.killreportfields.shooter_id = null;
            this.animalfields.shooter_id = null;
            this.shooter_name = null;
            this.killreportfields.kindofhunt = null;
            this.animalfields.animal_id = null;
            this.killreportfields.killdate = this.todaysdate();
            this.killreportfields.season = '20/21';
            this.killreportfields.area_id = null;
            this.area_name = null;
            this.killreportfields.place = null;
            this.killreportfields.report_status = 'green';
            this.killreportfields.locked = 'no';
            this.killreportfields.image = 'default.png',
            this.animalfields.species = null;
            this.animalfields.speciestype = null;
            this.animalfields.engspecies = null;
            this.animalfields.age = null;
            this.animalfields.sex = null;
            this.animalfields.antlers = null;
            this.animalfields.points = null;

            this.toggledformeat = [];
        },
        cancelReportProcess() {
            window.location = this.accountPage;
        },
        getMeatList(killreport_id) {
            let meatlist = []
            // console.log('getMeatList->killreport_id');
            // console.log(killreport_id);
            if(this.toggledformeat.length > 0) {
                this.toggledformeat.forEach(user_id => {
                    let meat = {
                        'killreport_id': killreport_id,
                        'user_id': user_id,
                        'share_kilogram': this.share_kilogram
                    };
                    meatlist.push(meat);
                });
            } else {
                meatlist.push({'killreport_id': killreport_id, 'user_id': null, 'share_kilogram': null});
            }

            return meatlist;
        },
        submitForm() {
            console.log(this.animalfields);

            this.share_kilogram = (this.toggledformeat.length > 0) ? this.getShareKilo() : 0;
            
            // console.log(this.killreportfields.killdate);
            axios.post(this.animalUrl, this.animalfields)
				    .then(response => {
                        // this.animalfields = {};
                        console.log("ANIMAL RESPONSE");
                        // console.log(response);
                        console.log("animal_id: " + response.data.animal.id);
                        // this.killreportfields.animal_id = response.data.animal.id;
                        this.killreportfields.animal_id = response.data.animal.id;
                        // window.location = "http://localhost:8080/www/jaktsite/public/killreports/create";
                         axios.post(this.killreportUrl, this.killreportfields)
                            .then(response => {
                                
                                this.killreportfields = {};
                                console.log("KILLREPORT RESPONSE [data.killreport.id]:");
                                console.log(response.data.killreport.id);
                                let killreport_id = response.data.killreport.id;
                                let meatlist = this.getMeatList(killreport_id);
                                // console.log('meatlist');
                                // console.log(meatlist);
                                axios.post(this.meatUrl, meatlist)
                                    .then(response => {
                                        console.log("MEAT STORED");
                                    })
                                    .catch(error => {
                                        console.log("MEAT ERROR:");
                                        consoel.log(error);
                                    })
                            })
                            .catch(error => {
                                console.log("KILLREPORT STORE ERROR:");
                                console.log("animal_id: " + this.killreportfields.animal_id);
                                console.log(error);
                            });
                        
                        window.location = this.killreportIndexUrl;
                        
                    })
                    .catch(error => {
                        console.log("ANIMAL STORE ERROR:")
                        console.log(error);
                    });
            

            // this.submitKillreport();
            
            
        },
        // submitKillreport() {
        //     console.log("this.killreportfields");
        //     console.log(this.killreportfields);
        //     axios.post(this.killreportUrl, this.killreportfields)
        //             .then(response => {
                        
        //                 this.killreportfields = {};
        //                 console.log("KILLREPORT RESPONSE:");
        //                 console.log(response);
        //             })
        //             .catch(error => {
        //                 console.log("KILLREPORT STORE ERROR:");
        //                 console.log("animal_id: " + this.killreportfields.animal_id);
        //                 console.log(error);
        //             });
        // }

    }
  }
</script>
<style scope>
.topinforeport {
    border-left: 8px solid #5d73a2; 
    border-top: 1px solid lightgray;
}
.weightreport {
    border-left: 8px solid #5d73a2; 
    border-top: 1px solid lightgray;
}
.meatreport {
    border-left: 8px solid #5d73a2; 
    border-top: 1px solid lightgray;
}
    
</style>