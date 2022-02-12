<template>
   <div>

        <div>

            <div class="" style="margin-top:-20px">
                <mdb-card class='w-100' color="unique-color-dark">

                    <mdb-card-text>
                        <div class="d-flex justify-content-between">
                            <span style="min-width: 50px;"></span>

                            <div>
                                <span style="margin-top: 2px;">#{{this.killreport.id}} RAPPORT </span>

                                <span v-if="killreport.report_status == 'green'" style="font-size: 12px; color: rgb(145 214 148); margin-top: 4px;">KLAR</span>
                                <span v-else style="font-size: 12px; color: #ffbb33; margin-top: 4px;">EJ KLAR</span>
                            </div>

                            <div v-if="authUser.role != 'admin'" class="pr-3">
                                <mdb-icon style="font-size:12px; margin-left: 10px; margin-top: 6px;" v-if="killreport.locked == 'yes'" icon="lock"/>
                                <mdb-icon style="font-size:12px; margin-left: 10px; margin-top: 6px;" v-else icon="lock-open"/> 
                            </div>

                            <div v-else class="d-flex flex-row justify-content-center" style="margin-top: 1px; margin-right: 10px;">
                                <mdb-icon v-if="killreport.locked == 'yes'" style="font-size:12px; margin-right: 5px; margin-top: 5px; color: #49d841;" icon="lock"/>
                                <mdb-icon v-else style="font-size:12px; margin-right: 5px; margin-top: 5px; color: gray;" icon="lock"/>
                                <!-- Default switch -->
                                <div class="custom-control custom-switch" style="margin-right: -5px;">
                                    <input @change="toggleReportLock" type="checkbox" style="margin-right: -2px;" class="custom-control-input" id="customSwitches" :checked="killreport.locked == 'no'">
                                    <label class="custom-control-label" for="customSwitches"> </label>
                                </div>
                                <mdb-icon v-if="killreport.locked == 'no'" style="font-size:12px; margin-right: -5px; margin-top: 5px; color: #f0ac32;" icon="lock-open"/> 
                                <mdb-icon v-else style="font-size:12px; margin-right: -5px; margin-top: 5px; color: gray;" icon="lock-open"/> 
                            </div>

                        </div>
                    </mdb-card-text>
                </mdb-card>
            </div>


            <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around" :style="authUser.role == 'admin' ? 'margin-right: 5px;' : 'margin-left: 15px;'">
                <!-- <p v-if="authUser.role == 'admin'"></p> -->
              
               

                <mdb-btn-group size="sm" >
                    <mdb-btn color="mdb-color" @click.native="backToKillreportIndex" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn> 
                    <mdb-btn  v-if="authUser.role == 'admin' || killreport.locked == 'no'" :color="untouched ? 'mdb-color' : 'indigo'" @click.native="saveChanges" :disabled="savable" size="sm"><mdb-icon icon="save"/></mdb-btn>
                    <mdb-btn v-else color="mdb-color" :disabled="true" size="sm"><mdb-icon icon="lock"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toImagesView" size="sm"><mdb-icon icon="images"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="undoModal = true" size="sm"><mdb-icon icon="undo"/></mdb-btn>
                </mdb-btn-group>

                 <!-- <div v-if="authUser.role == 'admin'" class="d-flex flex-row justify-content-center" style="margin-top: 10px; padding-right: 5px;">
                    <mdb-icon v-if="killreport.locked == 'yes'" style="font-size:12px; margin-right: 5px; margin-top: 5px; color: #d84141;" icon="lock"/>
                    <mdb-icon v-else style="font-size:12px; margin-right: 5px; margin-top: 5px; color: gray;" icon="lock"/>
                    
                    <div class="custom-control custom-switch" style="margin-right: -2px;">
                        <input @change="toggleReportLock" type="checkbox" style="margin-right: -2px;" class="custom-control-input" id="customSwitches" :checked="killreport.locked == 'no'">
                        <label class="custom-control-label" for="customSwitches"> </label>
                    </div>
                    <mdb-icon v-if="killreport.locked == 'no'" style="font-size:12px; margin-right: -5px; margin-top: 5px; color: #235cde;" icon="lock-open"/> 
                    <mdb-icon v-else style="font-size:12px; margin-right: -5px; margin-top: 5px; color: gray;" icon="lock-open"/> 
                </div> -->

                <!-- <div v-else style="width: 75px;">
                    <p></p>
                </div> -->
                

            </div>
            <!-- </mdb-btn-toolbar> -->
                       <!-- <mdb-icon icon="balance-scale"/> -->
            <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                <!-- <mdb-btn color="mdb-color" @click.native="backToKillreportIndex" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn> -->
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateH" :active="activeH" size="sm">Jakt</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateM" :active="activeM" size="sm">Kött</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateW" :active="activeW" size="sm">Vikter</mdb-btn>
                </mdb-btn-group>
                <!-- <mdb-btn color="mdb-color" @click.native="undoModal = true" size="sm"><mdb-icon icon="undo"/></mdb-btn> -->

            </div>
            <!-- </mdb-btn-toolbar> -->


        </div>

        <!-- MODAL FÖR ATT ÅTERSTÄLLA DATA -->
        <mdb-modal size="sm" :show="undoModal" @close="undoModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Återställ data till orginalvärdena</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <p>Ifall du vill börja om från början.</p>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="danger" size="sm" @click.native="undoChanges">Återställ</mdb-btn>
                <mdb-btn color="blue-grey" size="sm" @click.native="undoModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

        <!-- MODAL FÖR ATT RADERA KILLREPORT -->
        <mdb-modal size="sm" :show="deleteModal" @close="deleteModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Radera rapporten</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <p>Detta tar oåterkalleligt bort rapporten, djuret, köttilldelning och bilder som är associerat med rapporten. Vill du fortsätta?</p>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="danger" size="sm" @click.native="deleteReport">Radera</mdb-btn>
                <mdb-btn color="blue-grey" size="sm" @click.native="deleteModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

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
                            <mdb-btn class="mb-0" style="width: 300px" :color="areaSelected.id == area.id ? 'indigo' : 'grey'" @click="setArea(area)">{{area.area_name}}</mdb-btn>
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

       <!-- MODAL FÖR ÄNDRA DJUR-->
        <mdb-modal size="sm" :show="speciesModal" @close="speciesModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra djur</mdb-modal-title>
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

       <!-- MODAL FÖR ÄNDRA DJURKVALIFICERING-->
        <mdb-modal size="sm" :show="speciestypeModal" @close="speciestypeModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra djurkvalificering</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>

               <div
                v-if="speciesSelected == 'Älg'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Tjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Tjur')" class='w-100 m-0 mb-1'>Tjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Ko' ? 'indigo' : 'grey'" @click="setSpeciesType('Ko')" class='w-100 m-0 mb-1'>Ko</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Kviga' ? 'indigo' : 'grey'" @click="setSpeciesType('Kviga')" class='w-100 m-0 mb-1'>Kviga</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Tjurkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Tjurkalv')" class='w-100 m-0 mb-1'>Tjurkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Kvigkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Kvigkalv')" class='w-100 m-0 mb-1'>Kvigkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämd kalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kalv')" class='w-100 m-0 mb-1'>Obestämd kalv</mdb-btn></div>
                    </div>
                </div>

                <div
                v-else-if="krondov(speciesSelected)"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Hjort' ? 'indigo' : 'grey'" @click="setSpeciesType('Hjort')" class='w-100 m-0 mb-1'>Hjort</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Hind' ? 'indigo' : 'grey'" @click="setSpeciesType('Hind')" class='w-100 m-0 mb-1'>Hind</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Smalhind' ? 'indigo' : 'grey'" @click="setSpeciesType('Smalhind')" class='w-100 m-0 mb-1'>Smalhind</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Hjortkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Hjortkalv')" class='w-100 m-0 mb-1'>Hjortkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Hindkalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Hindkalv')" class='w-100 m-0 mb-1'>Hindkalv</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämd kalv' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kalv')" class='w-100 m-0 mb-1'>Obestämd kalv</mdb-btn></div>
                    </div>
                </div>

                <div
                v-else-if="speciesSelected == 'Rådjur'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Bock' ? 'indigo' : 'grey'" @click="setSpeciesType('Bock')" class='w-100 m-0 mb-1'>Bock</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Get' ? 'indigo' : 'grey'" @click="setSpeciesType('Get')" class='w-100 m-0 mb-1'>Get</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Smaldjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Smaldjur')" class='w-100 m-0 mb-1'>Smaldjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Bockkilling' ? 'indigo' : 'grey'" @click="setSpeciesType('Bockkilling')" class='w-100 m-0 mb-1'>Bockkilling</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Getkilling' ? 'indigo' : 'grey'" @click="setSpeciesType('Getkilling')" class='w-100 m-0 mb-1'>Getkilling</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämd killing' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd killing')" class='w-100 m-0 mb-1'>Obestämd killing</mdb-btn></div>
                    </div>
                </div>

                <div
                v-else-if="speciesSelected == 'Vildsvin'"
                >
                    <div class="d-flex flex-column">
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Galt' ? 'indigo' : 'grey'" @click="setSpeciesType('Galt')" class='w-100 m-0 mb-1'>Galt</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämt vuxet hondjur' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämt vuxet hondjur')" class='w-100 m-0 mb-1'>Obestämt vuxet hondjur</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Sugga' ? 'indigo' : 'grey'" @click="setSpeciesType('Sugga')" class='w-100 m-0 mb-1'>Sugga</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Gylta' ? 'indigo' : 'grey'" @click="setSpeciesType('Gylta')" class='w-100 m-0 mb-1'>Gylta</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Galtkulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Galtkulting')" class='w-100 m-0 mb-1'>Galtkulting</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Suggkulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Suggkulting')" class='w-100 m-0 mb-1'>Suggkulting</mdb-btn></div>
                        <div class="p-0"><mdb-btn :color="speciestypeSelected == 'Obestämd kulting' ? 'indigo' : 'grey'" @click="setSpeciesType('Obestämd kulting')" class='w-100 m-0 mb-1'>Obestämd kulting</mdb-btn></div>
                    </div>
                </div>

            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="speciestypeModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

        <!-- MODAL FÖR ÄNDRA HORN-->
        <mdb-modal size="sm" :show="antlersModal" @close="antlersModal = false">
            <mdb-modal-header>
                <mdb-modal-title>Ändra horn</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <div class="d-flex flex-column">
                    <div class="p-0"><mdb-btn :color="antlersSelected == 'Spets' ? 'indigo' : 'grey'" @click="setAntlers('Spets')" class='w-100 m-0 mb-1'>Spets</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="antlersSelected == 'Stång' ? 'indigo' : 'grey'" @click="setAntlers('Stång')" class='w-100 m-0 mb-1'>Stång</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="antlersSelected == 'Stång/Halvskovel' ? 'indigo' : 'grey'" @click="setAntlers('Stång/Halvskovel')" class='w-100 m-0 mb-1'>Stång/Halvskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="antlersSelected == 'Halvskovel' ? 'indigo' : 'grey'" @click="setAntlers('Halvskovel')" class='w-100 m-0 mb-1'>Halvskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="antlersSelected == 'Halvskovel/Helskovel' ? 'indigo' : 'grey'" @click="setAntlers('Halvskovel/Helskovel')" class='w-100 m-0 mb-1'>Halvskovel/Helskovel</mdb-btn></div>
                    <div class="p-0"><mdb-btn :color="antlersSelected == 'Helskovel' ? 'indigo' : 'grey'" @click="setAntlers('Helskovel')" class='w-100 m-0 mb-1'>Helskovel</mdb-btn></div>
                </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="antlersModal = false">Ångra</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>

        <div></div>

        <div v-if="activeH">
            

            <img class="par" :src="killreportImage" alt="very cool bg">

            <div style="background-color: #1c2331; padding-left: 5px;">
            
                <i style="font-size: 10px; color: white;">Skp.: {{this.killreport.created_at}}, Uppd.: {{this.killreport.updated_at}}</i>
                
                <!-- <i style="font-size: 10px; color: white; margin-left: 10px;">Skapad: {{this.killreport.created_at}}</i><br>
                <i style="font-size: 10px; color: white; margin-left: 10px;">uppdaterad: {{this.killreport.updated_at}} </i> -->
            </div>

            <!-- <div class='w-100 meatallocationheader d-flex flex-row justify-content-center mt-2 mb-1'>
                <span style="margin-top: 2px;">RAPPORTKORTETS VEM/VAR/NÄR</span>
            </div> -->

            <mdb-card>
                <mdb-card-body :class="shooterSelected.id !== originshooter.id || reporterSelected.id !== originreporter.id || kindofhuntSelected != originkindofhunt ? 'cardborderchanged' : 'cardborder'">
                    <mdb-card-title class="d-flex justify-content-center titlecolor p-1">SKYTT & RAPPORTÖR</mdb-card-title>

                        <!-- rapportör -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="reporterSelected.id !== originreporter.id ? 'changedinput' : ''" type="text" class="w-100" label="Rapportör" v-model="this.reporterName" />
                                <p class="inputmsg" v-if="authUser.role == 'admin' && reporterSelected.id !== originreporter.id">Urspr. rapportör: {{this.originreporterName}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn v-if="authUser.role == 'admin'" class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="reporterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <!-- skytt -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="shooterSelected.id !== originshooter.id ? 'changedinput' : ''" type="text" class="w-100" label="Skytt" v-model="this.shooterName" />
                                <p v-if="shooterSelected.id !== originshooter.id" class="inputmsg">Urspr. skytt: {{this.originshooterName}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="shooterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <!-- typ av jakt -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="kindofhuntSelected != originkindofhunt ? 'changedinput': ''" type="text" class="w-100" label="Sorts jakt" v-model="this.kindofhuntSelected" />
                                <p v-if="kindofhuntSelected != originkindofhunt" class="inputmsg">Urspr. sort: {{this.originkindofhunt}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="kindofhuntModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                </mdb-card-body>
            </mdb-card>
            

            <!-- tid och plats -->
            <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorTimeandPlace()">
                    <mdb-card-title class="d-flex justify-content-center titlecolor p-1">TID & PLATS</mdb-card-title>

                    <mdb-input style="color: red;" :class="dateinputcolor()" type="date" v-model="killdateSelected" @change="checkKilldate"/>
                    <p class="errormsg" v-if="wrongkilldate">Ogiltigt datum</p>
                    <p v-if="dateinputcolor() == 'changedinput'" class="inputmsg">Urspr. datum: {{this.originkilldate}}</p>

                    <mdb-row>
                        <mdb-col col="9">
                            <mdb-input disabled :class="areaSelected.id !== originarea.id ? 'changedinput': ''" type="text" v-model="areaSelected.area_name"/>
                            <p v-if="areaSelected.id !== originarea.id" class="inputmsg">Urspr. område: {{this.originareaName}}</p>
                        </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="areaModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                    <mdb-input type="textarea" :class="placechanged ? 'changedinput' : ''" label="Beskrivning av plats" v-model="placeSelected" @change="checkPlaceChanges" :rows="5"/>

                </mdb-card-body>
            </mdb-card>

            <!-- djur -->
            <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorAnimal()">
                    <mdb-card-title class="d-flex justify-content-center titlecolor p-1">DJUR & HORN/TAGGAR</mdb-card-title>

                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input :class="speciesSelected != originSpecies ? 'changedinput' : ''" disabled type="text" class="w-100" label="Djur" v-model="speciesSelected" />
                                <p v-if="speciesSelected != originSpecies" class="inputmsg">Urspr. djur: {{this.originSpecies}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="speciesModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="speciestypeinputcolor()" type="text" class="w-100" label="Djurkvalificering" v-model="speciestypeSelected" />
                                <p class="errormsg" v-if="wrongspeciestype">Ogiltig djurkvalificering</p>
                                <p v-if="speciestypeinputcolor() == 'changedinput'" class="inputmsg">Urspr. djurkvalif.: {{this.originSpeciestype}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="speciestypeModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <mdb-row v-if="points()">
                            <mdb-col col="12">
                                <mdb-input :class="pointsSelected != originPoints ? 'changedinput' : ''" type="number" min="0" step="1" label="Taggar" v-model="pointsSelected" @change="pointsChanged" />
                                <p v-if="pointsSelected != originPoints" class="inputmsg" >Urspr. taggar.: {{this.originPoints}}</p>
                            </mdb-col>

                        </mdb-row>

                        <mdb-row v-if="antlers()">
                            <mdb-col col="9">
                                <mdb-input :class="antlersSelected != originAntlers ? 'changedinput' : ''" disabled label="Horn" v-model="antlersSelected" />
                                <p v-if="antlersSelected != originAntlers" class="inputmsg" >Urspr. horn.: {{this.originAntlers}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="grey" @click.native="antlersModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                </mdb-card-body>
            </mdb-card>

            <!-- <mdb-card class="mt-2" v-if="authUser.role == 'admin' && killreport.locked == 'yes'">
                <mdb-card-body class="d-flex justify-content-center titlecolor p-1">
                    <mdb-btn color="deep-orange" @click.native="toggleReportLock" size='sm'>Lås upp rapporten</mdb-btn>
                </mdb-card-body>
            </mdb-card>

            <mdb-card class="mt-2" v-if="authUser.role == 'admin' && killreport.locked == 'no'">
                <mdb-card-body class="d-flex justify-content-center titlecolor p-1">
                    <mdb-btn color="deep-orange" @click.native="toggleReportLock" size='sm'>Lås rapporten</mdb-btn>
                </mdb-card-body>
            </mdb-card> -->

            <!-- <mdb-card class="mt-2" v-if="authUser.role == 'admin'">
                <mdb-card-body class="d-flex justify-content-center titlecolor p-1"> -->

            <div v-if="authUser.role == 'admin'" class="d-flex justify-content-center mt-4">
                <mdb-btn color="danger" @click.native="deleteModal = true" size='sm'>Radera rapporten</mdb-btn>
            </div>
                <!-- </mdb-card-body>
            </mdb-card> -->
                


       </div> <!-- /rapportdata -->
       

       <div v-else-if="activeW">

           <div class='w-100 meatallocationheader d-flex flex-row justify-content-center mt-2 mb-1'>
                <span style="margin-top: 2px;">VÄGDA OCH UPPSKATTADE VIKTER</span>
            </div>

           <!-- flyttad på test hit -->
           <mdb-card class="mt-2">
                <!-- <mdb-card-body :class="cardbodycolorcarcassweight() ? 'cardborderchanged' : 'cardborder'"> -->
                    <div class="d-flex flex-column">
                        <div class="p-3 mb-2 weight-inputs" :class="cardbodycolorcarcassweight() ? 'cardborderchanged' : 'cardborder'">
                            <mdb-input :class="carcass_weightSelected != origincarcass_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägd slaktvikt" v-model.number="carcass_weightSelected" @change="checkcarcassweightchanges"/>
                            <!-- <p v-if="carcass_weightSelected != origincarcass_weight" class="inputmsg" >Urspr.: {{this.origincarcass_weight}}</p> -->
                            <mdb-input :class="aprox_carcass_weightSelected != originaprox_carcass_weight ? 'changedinput' : ''" type="number" step="0.1" label="Uppsk. slaktvikt" v-model.number="aprox_carcass_weightSelected" @change="checkaproxcarcassweightchanges"/>
                            <!-- <p v-if="aprox_carcass_weightSelected != originaprox_carcass_weight" class="inputmsg" >Urspr.: {{this.originaprox_carcass_weight}}</p> -->
                        </div>
                <!-- </mdb-card-body>
            </mdb-card> -->

           <!-- <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorliveweight() ? 'cardborderchanged' : 'cardborder'"> -->
                    <!-- <div class="p-3 mb-2"> -->
                        <div class="p-3 mb-2 weight-inputs" :class="cardbodycolorliveweight() ? 'cardborderchanged' : 'cardborder'"> 
                            <mdb-input :class="live_weightSelected != originlive_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägd levandevikt" v-model.number="live_weightSelected" @change="checkliveweightchanges"/>
                            <!-- <p v-if="live_weightSelected != originlive_weight" class="inputmsg" >Urspr.: {{this.originlive_weight}}</p> -->
                            <mdb-input :class="aprox_live_weightSelected != originaprox_live_weight ? 'changedinput' : ''" type="number" step="0.1" label="Uppsk. levandevikt" v-model.number="aprox_live_weightSelected" @change="checkaproxliveweightchanges"/>
                            <!-- <p v-if="aprox_live_weightSelected != originaprox_live_weight" class="inputmsg" >Urspr.: {{this.originaprox_live_weight}}</p> -->
                        </div>
                <!-- </mdb-card-body> -->
            <!-- </mdb-card> -->
            <!-- <mdb-card class="mt-2"> -->
            <!-- <mdb-card-body :class="cardbodycolorpassadweight() ? 'cardborderchanged' : 'cardborder'"> -->
                    <!-- <div class="p-3 mb-2"> -->
                        <div class="p-3 mb-2 weight-inputs" :class="cardbodycolorpassadweight() ? 'cardborderchanged' : 'cardborder'">
                            <mdb-input :class="passad_weightSelected != originpassad_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägd passad vikt" v-model.number="passad_weightSelected" @change="checkpassadweightchanges"/>
                            <!-- <p v-if="passad_weightSelected != originpassad_weight" class="inputmsg" >Urspr.: {{this.originpassad_weight}}</p> -->
                            <mdb-input :class="aprox_passad_weightSelected != originaprox_passad_weight ? 'changedinput' : ''" type="number" step="0.1" label="Uppsk. passad vikt" v-model.number="aprox_passad_weightSelected" @change="checkaproxpassadweightchanges"/>
                            <!-- <p v-if="aprox_passad_weightSelected != originaprox_passad_weight" class="inputmsg" >Urspr.: {{this.originaprox_passad_weight}}</p> -->
                        </div>
                <!-- </mdb-card-body> -->
            <!-- </mdb-card> -->

            <!-- orginal slaktvikt platsen -->

            <!-- <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorcutweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2"> -->
                    <div class="p-3 mb-2 weight-inputs" :class="cardbodycolorcutweight() ? 'cardborderchanged' : 'cardborder'">
                        <mdb-input :class="cut_weightSelected != origincut_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägda styckdetaljer" v-model.number="cut_weightSelected" @change="checkcutweightchanges"/>
                        <!-- <p v-if="cut_weightSelected != origincut_weight" class="inputmsg" >Urspr.: {{this.origincut_weight}}</p> -->
                    </div>
                <!-- </mdb-card-body>
           </mdb-card> -->

           <!-- <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorheartweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2"> -->
                        <div class="p-3 weight-inputs" :class="cardbodycolorheartweight() ? 'cardborderchanged' : 'cardborder'">
                            <mdb-input :class="heart_weightSelected != originheart_weight ? 'changedinput' : ''" type="number" step="0.001" label="Vägd hjärtvikt (kg)" v-model.number="heart_weightSelected" @change="checkheartweightchanges"/>
                            <!-- <p v-if="heart_weightSelected != originheart_weight" class="inputmsg" >Urspr.: {{this.originheart_weight}}</p> -->
                        </div>
                    </div> <!-- d-flex column -->
                <!-- </mdb-card-body> -->
          </mdb-card>
       </div>

       <div v-else-if="activeM">
            <!-- MODAL FÖR ATT ÄNDRA KÖTTILLDELNINGEN -->
            <mdb-modal size="sm" :show="meetModal" @close="meetModal = false">
                <mdb-modal-header>
                    <mdb-modal-title>Ändra köttilldelning: {{speciesSelected}}</mdb-modal-title>
                </mdb-modal-header>
                <mdb-modal-body>
                    <div class="d-flex flex-row justify-content-center">
                        <div class="custom-control custom-switch" style="width:110px">
                            <input type="checkbox" class="custom-control-input" v-model="showAverageMeat" id="customSwitches">
                            <label v-if="showAverageMeat" class="custom-control-label" for="customSwitches">Snitt</label>
                            <label v-else class="custom-control-label" for="customSwitches">Jaktsäsong {{season}}</label>
                        </div>
                    </div>

                    <div class="d-flex justify-content-center">
                        <mdb-btn class="mb-0" size='sm' style="width: 200px" :color="isToggledForMeat(this.anonhunter[0].id) ? 'indigo' : 'grey'" @click.native="togglemeat(anonhunter[0])">Utanför jaktlaget</mdb-btn>
                    </div>

                    <div v-if="this.speciesSelected == 'Älg'">
                        <div v-if="showAverageMeat" class="d-flex flex-column">      
                            <div
                            v-for="hunter in meatMooseAverage"
                            :key="hunter.id"
                            >
                            <div
                                class="d-flex justify-content-center">
                                     <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
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
                                    <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                                </div>    
                            </div>
                        </div>
                    </div>

                    <div v-if="this.speciesSelected == 'Kronvilt'">
                        <div v-if="showAverageMeat" class="d-flex flex-column">  
                            <div
                            v-for="hunter in meatReddeerAverage"
                            :key="hunter.id"
                            >
                            <div
                                class="d-flex justify-content-center">
                                     <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                                </div>
                            </div>
                        </div>
                        <div v-else class="d-flex flex-column">
                            <div
                            v-for="hunter in meatReddeerThisSeason"
                            :key="hunter.id"
                            >   
                                <div class="d-flex justify-content-center">
                                    <!-- <img class="img-fluid z-depth-1 rounded-circle" style="width: 50px; height: 50px; margin-top:5px" :alt="authUser.username" :src="gravatarSrc(hunter.email)"> -->
                                    <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                                </div>    
                            </div>
                        </div>
                    </div>

                    <div v-if="this.speciesSelected == 'Dovvilt'">
                        <div v-if="showAverageMeat" class="d-flex flex-column">  
                            <div
                            v-for="hunter in meatFallowdeerAverage"
                            :key="hunter.id"
                            >
                            <div
                                class="d-flex justify-content-center">
                                     <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
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
                                    <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                                </div>    
                            </div>
                        </div>
                    </div>

                    <div v-if="this.speciesSelected == 'Rådjur'">
                        <div v-if="showAverageMeat" class="d-flex flex-column">  
                            <div
                            v-for="hunter in meatRoedeerAverage"
                            :key="hunter.id"
                            >
                            <div
                                class="d-flex justify-content-center">
                                     <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
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
                                    <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                                </div>    
                            </div>
                        </div>
                    </div>

                    <div v-if="this.speciesSelected == 'Vildsvin'">
                        <div v-if="showAverageMeat" class="d-flex flex-column">  
                            <div
                            v-for="hunter in meatBoarAverage"
                            :key="hunter.id"
                            >
                            <div
                                class="d-flex justify-content-center">
                                     <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
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
                                    <mdb-btn class="mb-0" style="width: 300px" :color="isToggledForMeat(hunter.id) ? 'indigo' : 'grey'" @click="togglemeat(hunter)" >{{hunter.firstname}} {{hunter.lastname}}<br>-- {{hunter.kg}} kg --</mdb-btn>
                                </div>    
                            </div>
                        </div>
                    </div>
                </mdb-modal-body>
                <mdb-modal-footer>
                    <mdb-btn color="blue-grey" size="sm" @click.native="meetModal = false">Ångra</mdb-btn>
                    <mdb-btn color="blue-grey" size="sm" @click.native="meetModal = false">OK!</mdb-btn>
                </mdb-modal-footer>
            </mdb-modal>

            <!-- <mdb-card class="mt-2">
               <mdb-card-header class="bg-blue-color pl-4"> -->
            <!-- <div class="d-flex flex-row justify-content-center mt-2 mb-1"> -->
                <!-- <mdb-card class='w-100 meatallocationheader' >
                    <mdb-card-text class="d-flex justify-content-center">
                        <span style="margin-top: 2px;">KÖTTILLDELNING </span>
                    </mdb-card-text>
                </mdb-card>
            </div> -->
    
                <div class='w-100 meatallocationheader d-flex flex-row justify-content-center mt-2 mb-1'>
                    <span style="margin-top: 2px;">KÖTTILLDELNING </span>
                </div>
                    
    
                   <div class="d-flex flex-row justify-content-center">
                       Vikt som skall fördelas: {{ carcassWeight }} kg
                    </div>
                   <div class="d-flex flex-row justify-content-center" :class="totalmeat != carcassWeight ? 'totally_allocated_error d-flex flex-row justify-content-center': 'd-flex flex-row justify-content-center'">
                       Total fördelat: {{ totalmeat }} kg
                    </div>
               <!-- </mdb-card-header>
            </mdb-card> -->

            <mdb-card class="mt-2">
                <mdb-card-body class="cardborder">
                <mdb-card-title class="d-flex justify-content-center titlecolor p-1">SLAKTVIKT</mdb-card-title>
                <div class="d-flex flex-row justify-content-center w-100 mt-1" style="height: 12px;">
                        <span v-if="totalmeat != carcassWeight" style="font-size: 12px; color: red;">GLÖM INTE ATT FÖRDELA KÖTTET!</span>
                    </div>
                    <div class="p-3">
                        <mdb-input  type="number" step="0.1" label="Vägd slaktvikt" v-model.number="carcass_weightSelected" @change="checkcarcassweightchanges"/>
                        <mdb-input type="number" step="0.1" label="Uppsk. slaktvikt" v-model.number="aprox_carcass_weightSelected" @change="checkaproxcarcassweightchanges"/>
                    </div>
                    
                </mdb-card-body>
            </mdb-card>

            <div class="d-flex flex-row justify-content-around meat_button_group mt-2">
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="divideEven" :disabled="totalmeat == carcassWeight" size="sm">Fördela - <mdb-icon icon="balance-scale"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="meetModal = true" size="sm">Ändra jägare - <mdb-icon icon="user-plus"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="meetAll()" size="sm">Alla - <mdb-icon icon="user-plus"/></mdb-btn>
                </mdb-btn-group>
            </div>
            <mdb-card class="mt-2">
               <!-- <mdb-card-header class="bg-blue-color pl-4">
                    
                </mdb-card-header> -->
               <mdb-card-body :class="totalmeat == carcassWeight ? 'cardborder' : 'meatcardbordererror'">
                   <mdb-card-title class="d-flex justify-content-center titlecolor p-1">JÄGARE</mdb-card-title>
                   <div
                        v-if="toggledformeat.length > 0">
                        <div
                            v-for="meat in toggledformeat"
                            :key="meat.id">

                            <mdb-input
                                v-if="huntername(meat.user_id) != 'Ej satt'"
                                type="Number" :label="huntername(meat.user_id)" v-model.number="meat.share_kilogram" @change="checkTotal"/>

                            
                        </div>
                    </div>
                    <div
                        v-else>
                         <mdb-input
                            v-if="toggledformeat.length == 0"
                                type="Number" label="EJ SATT" disabled/>
                    </div>
                   
               </mdb-card-body>
           </mdb-card>

           <mdb-card class="mt-2">
               <mdb-card-body :class="totalmeat == carcassWeight ? 'cardborder' : 'meatcardbordererror'">
                   <mdb-input
                        type="Number" label="Skottrensning" v-model.number="waist" @change="checkTotal"/>
               </mdb-card-body>
           </mdb-card>

            <mdb-card class="mt-2">
                <mdb-card-body :class="totalmeat == carcassWeight ? 'cardborder' : 'meatcardbordererror'">
                    <mdb-input type="textarea" label="Anteckning" v-model="waste_notes" :rows="5" @change="checkChanges"/>
                </mdb-card-body>

            </mdb-card>
       </div>

   </div>
</template>
<script>
  import { mdbPopover, mdbBtn, mdbBtnGroup, mdbDropdown, mdbDropdownItem, mdbDropdownMenu, mdbDropdownToggle, mdbCard, mdbCardBody, mdbCardTitle, mdbCardText, mdbRow, mdbCol, mdbBadge, mdbInput, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbIcon, mdbCardImage, mdbCardHeader } from 'mdbvue';
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
      mdbCardImage,
      mdbCardHeader,
      mdbPopover
    },
    props: [
            'authUser',
            'hunters',
            'anonhunter',
            'shooter',
            'reporter',
            'area',
            'areas',
            'killreport',
            'meats',
            'animal',
            'indexUrl',
            'imageUrl',
            'animalUrl',
            'killreportUrl',
            'killreportDeleteUrl',
            'meatUrl',
            'meatMooseAverage',
            'meatReddeerAverage',
            'meatFallowdeerAverage',
            'meatRoedeerAverage',
            'meatBoarAverage',
            'meatMooseThisSeason',
            'meatReddeerThisSeason',
            'meatFallowdeerThisSeason',
            'meatRoedeerThisSeason',
            'meatBoarThisSeason',
            'season',
            'killreportImage',
            'mailBaseUrl'
        ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            activeH: true,
            activeW: false,
            activeM: false,
            untouched: true,
            missingweights: true,
            shooterSelected: this.shooter,
            reporterSelected: this.reporter,
            killdateSelected: this.killreport.killdate.substring(0,10),
            areaSelected: this.area,
            placeSelected: this.killreport.place,
            kindofhuntSelected: this.killreport.kindofhunt,
            speciesSelected: this.animal.species,
            speciestypeSelected: this.animal.speciestype,
            pointsSelected: this.animal.points,
            antlersSelected: this.animal.antlers,
            live_weightSelected: this.animal.live_weight,
            aprox_live_weightSelected: this.animal.aprox_live_weight,
            passad_weightSelected: this.animal.passad_weight,
            aprox_passad_weightSelected: this.animal.aprox_passad_weight,
            carcass_weightSelected: this.animal.carcass_weight,
            aprox_carcass_weightSelected: this.animal.aprox_carcass_weight,
            cut_weightSelected: this.animal.cut_weight,
            heart_weightSelected: this.animal.heart_weight,
            shooterModal: false,
            reporterModal: false,
            kindofhuntModal: false,
            speciesModal: false,
            speciestypeModal: false,
            areaModal: false,
            antlersModal: false,
            undoModal: false,
            deleteModal: false,
            meetModal: false,
            killdateset: true,
            placechanged: false,
            wrongkilldate: false,
            wrongspeciestype: false,
            originkilldate: this.killreport.killdate.substring(0,10),
            originalseason: this.killreport.season,
            originarea: this.area,
            originareaName: this.area.area_name,
            originplace: this.killreport.place,
            originshooter: this.shooter,
            originreporter: this.reporter,
            originshooterName: this.shooter.firstname + " " + this.shooter.lastname,
            originreporterName: this.reporter.firstname + " " + this.reporter.lastname,
            originkindofhunt: this.killreport.kindofhunt,
            originSpecies: this.animal.species,
            originSpeciestype: this.animal.speciestype,
            originPoints: this.animal.points,
            originAntlers: this.animal.antlers,
            originlive_weight: this.animal.live_weight,
            originaprox_live_weight: this.animal.aprox_live_weight,
            originpassad_weight: this.animal.passad_weight,
            originaprox_passad_weight: this.animal.aprox_passad_weight,
            origincarcass_weight: this.animal.carcass_weight,
            originaprox_carcass_weight: this.animal.aprox_carcass_weight,
            origincut_weight: this.animal.cut_weight,
            originheart_weight: this.animal.heart_weight,
            orginalwaste_weight: this.animal.waste,
            orginalwaste_notes: this.animal.waste_notes,
            report_status: this.killreport.report_status,
            locked: this.killreport.locked,
            elkspeciestypes: ['Tjur', 'Obestämt vuxet hondjur', 'Ko', 'Kviga', 'Tjurkalv', 'Kvigkalv', 'Obestämd kalv'],
            roedeerspeciestypes: ['Bock', 'Obestämt vuxet hondjur', 'Get', 'Smaldjur', 'Bockkilling', 'Getkilling', 'Obestämd killing'],
            boarspeciestypes: ['Galt', 'Obestämt vuxet hondjur', 'Sugga', 'Gylta', 'Galtkulting', 'Suggkulting', 'Obestämd kulting'],
            krondovspeciestypes: ['Hjort', 'Obestämt vuxet hondjur', 'Hind', 'Smalhind', 'Hjortkalv', 'Hindkalv', 'Obestämd kalv'],
            waist: this.animal.waste,
            totalmeat: this.totallyDividedUp,
            toggledformeatfromstart: [],
            delete_from_toggledformeatfromstart: [],
            update_from_toggledformeatfromstart: [],
            create_from_toggledformeatfromstart: [],
            toggledformeat: [],
            showAverageMeat: true,
            meat_data: {
                deleted_at: null,
                id: this.meats[0].id,
                killreport_id: this.meats[0].killreport_id,
                share_kilogram: 0,
                share_lot: null,
                updated_at: null
            },
            waste_notes: this.animal.waste_notes,
        }

    },
    computed: {
        status() {
            let res = 'Klar'
            if(this.killreport.report_status == 'yellow') {
                res = 'Ej klar';
            }
            return res;
        },
        lockedCheck() {
            let res = "Ja";
            if(this.killreport.locked == 'no') {
                res = 'Nej';
            }
            return res;
        },
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
        areaId() {
            return this.areaSelected.id;
        },
        savable(){
            let meatok;
            var delete_all = ((this.toggledformeatfromstart.length == this.delete_from_toggledformeatfromstart.length) && (this.create_from_toggledformeatfromstart.length == 0));
            console.log("savable->delete_all: ", delete_all);
            let notallowed = this.wrongkilldate || this.wrongspeciestype;
            if(delete_all) {
                meatok = false;
            } else {
                meatok = this.totalmeat != this.carcassWeight;
            }

            console.log("this.untouched: ", this.untouched);
            console.log("notallowed: ", notallowed);
            console.log("meatok: ", meatok);
            return this.untouched || notallowed || meatok;
        },
        carcassWeight() {
            let carcass_kilo = 0;
            if(this.carcass_weightSelected != null) {
                carcass_kilo = this.carcass_weightSelected;
            } else if(this.aprox_carcass_weightSelected != null) {
                carcass_kilo = this.aprox_carcass_weightSelected;
            }
            return carcass_kilo;
        },
        totallyDividedUp() {
            const total = Object.values(this.meats).reduce((t, {share_kilogram}) => t + share_kilogram, 0) + this.waist;
            return total;
        }
    },
    mounted() {
        console.log("hunters: ");
        console.log(this.hunters);
        console.log("anonhunter: ");
        console.log(this.anonhunter);
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
        console.log("meats: ");
        console.log(this.meats);
        console.log("meats-length: ");
        console.log(this.meats.length);
        console.log("animalURL: ");
        console.log(this.animalUrl);
        console.log("meatURL: ");
        console.log(this.meatUrl);
        console.log("imageUrl:")
        console.log(this.imageUrl);
        console.log("mailBaseUrl: ", this.mailBaseUrl);

        console.log("killreportImage: ", this.killreportImage);



        console.log("this.originalseason: ", this.originalseason);
        

        let sortedMooseAverage = this.bubble(this.meatMooseAverage);
        let sortedReddeerAverage = this.bubble(this.meatReddeerAverage);
        let sortedFallowdeerAverage = this.bubble(this.meatFallowdeerAverage);
        let sortedRoedeerAverage = this.bubble(this.meatRoedeerAverage);
        let sortedBoarAverage= this.bubble(this.meatBoarAverage);

        let sortedMooseThisSeason = this.bubble(this.meatMooseThisSeason);
        let sortedReddeerThisSeason = this.bubble(this.meatReddeerThisSeason);
        let sortedFallowdeerThisSeason = this.bubble(this.meatFallowdeerThisSeason);
        let sortedRoedeerThisSeason = this.bubble(this.meatRoedeerThisSeason);
        let sortedBoarThisSeason = this.bubble(this.meatBoarThisSeason);

        console.log("**** AVERAGES ****");
        console.log("Älgmedel: ", this.meatMooseAverage);
        console.log("kronmedel: ", this.meatReddeerAverage);
        console.log("dovmedel: ", this.meatFallowdeerAverage);
        console.log("råmedel: ", this.meatRoedeerAverage);
        console.log("svinmedel: ", this.meatBoarAverage);

        console.log("**** TOTALT DENNA SÄSONGEN ****");
        console.log("Älgtotaldennasäsongen: ", this.meatMooseThisSeason);
        console.log("krontotaldennasäsongen: ", this.meatReddeerThisSeason);
        console.log("dovtotaldennasäsongen: ", this.meatFallowdeerThisSeason);
        console.log("råtotaldennasäsongen: ", this.meatRoedeerThisSeason);
        console.log("svintotaldennasäsongen: ", this.meatBoarThisSeason);




        console.log("Waste notes: ", this.waste_notes);

        this.setToggledAtStart()

        this.checkTotal();

    },
    methods: {
        setToggledAtStart() {
            // Ser till att fylla listan med de som fått köttilldelning
            // när vyn först laddas

            this.toggledformeatfromstart = [];
            this.toggledformeat = [];

            console.log('this.meats[0].user_id: ', this.meats[0].user_id);
            if(this.meats[0].user_id != null) {
                console.log('Lägger till i toggledformeat from start');
                this.meats.filter(obj => {
                    this.toggledformeatfromstart.push(obj);

                    // För att inte objektet i både toggledformeatfromstart och i toggledformeat skall vara samma objekt och därmed
                    // ändras båda två när andelen kött justeras så måste jag göra en deep copy och lägga den i toogledformeat. På så vis
                    // ändras bara share_kilogram i objektet i toggledformeat när man justerar i vyn. Medan objektet i toggledformeatfromstart inte
                    // ändras utan håller sig samma som står i databastabellen meat.
                    var deep_copy_of_obj = {};
                    for (const [key, value] of Object.entries(obj)) {
                        deep_copy_of_obj[key] = value;
                    }
                    this.toggledformeat.push(deep_copy_of_obj);
                });
            } else {
                // console.log("kommer hit där jag sätter this.toggledformeat = ['ingen']") 
                this.toggledformeatfromstart = [];
                this.toggledformeat = [];
            }
            // console.log("setToggledAtStart->this.toggledformeatfromstart", this.toggledformeatfromstart);
            // console.log("setToggledAtStart->this.toggledformeat", this.toggledformeat);
        },
        bubble(obj_unsorted) {
            // sorterar köttobjekten
            let bubbling = true;
            let notswapped = true;
            let obj = obj_unsorted;
            let n = Object.keys(obj).length - 1;
            while (bubbling) {
                notswapped = true;
                for (var k=0; k < n; k++) {
                    if (obj[k].kg > obj[k+1].kg) {
                        var temp = obj[k];
                        obj[k] = obj[k+1];
                        obj[k+1] = temp;
                        notswapped = false;
                    }
                }
                if (notswapped) {
                    bubbling = false;
                }
            }
            return obj;
        },
        togglemeat(hunter) {

            
            let meat = this.toggledformeat.filter(obj => {
                return obj.user_id === hunter.id;
            });

            // togglar av och på jägare som skall få kött
            if (meat.length > 0 && this.toggledformeat.length > 0) {
                // jägaren finns med och skall därför tas bort

                // söker igenom de som är toggladeformeat efter jägarens meatobjekt
                this.toggledformeat.forEach( (meat, index) => {
                    if( meat.user_id === hunter.id) {
                        this.toggledformeat.splice(index, 1); // tar bort det objektet
                    }
                });
                
            } else {
                // jägaren finns inte med och skall därför läggas till

                let new_meat = Object.assign({}, this.meat_data); // kopierar meat_data (OBS! shallow copy)

                let new_id = this.meat_data.id + this.toggledformeat.length;

                new_meat['id'] = new_id;

                new_meat['user_id'] = hunter.id;   // lägger till jägarens id

                let dateObj = new Date();
                new_meat['created_at'] = dateObj.toLocaleString(); //yyyy-mm-dd h:m:s
                this.toggledformeat.push(new_meat);
            }

            
            // this.toggledeletearray();
            // this.toggleupdatearray();
            // this.togglecreatearray();
            this.checkTotal();

            // this.checkChanges();
            // console.log("EFTER; this.update_from_toggledformeatfromstart: ", this.update_from_toggledformeatfromstart);
            // console.log("EFTER KONTROLL; this.delete_from_toggledformeatfromstart: ", this.delete_from_toggledformeatfromstart);


        },
        togglecreatearray() {
            // De nya som togglas in för meat skall creatas i databastabellen meat.
            
            // nollställer create_from_toggledformeatfromstart:array
            this.create_from_toggledformeatfromstart = [];
            // Går igenom alla som är togglade för meat
            this.toggledformeat.forEach( (meat, index) => {
                var new_hunter = true; // utgår från att jägaren är ny och skall läggas till.
                this.toggledformeatfromstart.forEach( (meat_from_start, index_from_start) => {
                    // Om jägaren redan fanns med från start jär det ingen ny jägare
                    if( meat.user_id === meat_from_start.user_id ) {
                        new_hunter = false;
                    }
                });
                // Om det är en ny jägare skall den raden skapas i databastabellen meat
                if( new_hunter ) {
                    console.log("Lägger till i create")
                    this.create_from_toggledformeatfromstart.push(meat);
                }
            });

            // console.log("togglecreatesrray->this.create_from_toggledformeatfromstart: ", this.create_from_toggledformeatfromstart);
            

            
        },
        toggleupdatearray() {
            // boolean
            var sameasbefore;

            // array
            this.update_from_toggledformeatfromstart = []; // tömmer listan för att fylla på igen de som saknas från start.


            this.toggledformeatfromstart.forEach( (meatfromstart, indexfromstart) => {
                sameasbefore = false; // Utgår från att jägarna som är kvar inte längre har samma andel kött.
                this.toggledformeat.forEach( (meat, index) => {
                    // Går igenom listan med de jägare som för tillfället är togglade för kött.
                    if( meat.user_id === meatfromstart.user_id ) {
                        // console.log("toggleupdatearray->meat.user_id: ", meat.user_id);
                        // console.log("toggleupdatearray->meat.share_kilogram "+ meat.share_kilogram + " vs meatfromstart.share_kilogram: " + meatfromstart.share_kilogram);

                        // Har jägaren samma antal kilo eller slots nu som i början så är det sameasbefore
                        // Annars lägger man till det förändrarde objektet meat i update_from_toggledformeatfromstart:array
                        if( ((meat.share_kilogram === meatfromstart.share_kilogram) && (meat.share_lot === meatfromstart.share_lot)) ) {
                            sameasbefore = true;
                        } else {
                            this.update_from_toggledformeatfromstart.push(meat)
                        }
                        // console.log("toggleupdatearray->sameasbefore: ", sameasbefore);
                    }
                });
            });
        },
        toggledeletearray() {
            // Kontrollerar vilka jägare som eventuellt skall tas bort från meat-tabellen i jämförelse med hur det var från start.
            var stillthere;
            this.delete_from_toggledformeatfromstart = []; // tömmer listan för att fylla på igen de som saknas från start.
            this.toggledformeatfromstart.forEach( (meatfromstart, indexfromstart) => {
                stillthere = false; // utgår ifrån att jägaren som var med från start inte längre är kvar.
                this.toggledformeat.forEach( (meat, index) => {
                    // Går igenom listan med de jägare som för tillfället är togglade för kött.
                    if( meat.user_id === meatfromstart.user_id ) {
                        stillthere = true;
                    }
                });
                if ( !stillthere ) {
                    // Är jägaren som var med från start inte kvar så skall den läggas i
                    // this.delete_from_toggledformeatfromstart
                    this.delete_from_toggledformeatfromstart.push(meatfromstart);
                }
            });
        },
        divideEven() { // fixa this.meats till this.toggledformeats
            let meattodivide = this.carcassWeight - this.waist;
            // let n = Object.keys(this.meats).length; // antalet som det skall fördelas på
            let n = Object.keys(this.toggledformeat).length; // antalet som det skall fördelas på
            let res = meattodivide/n;
            let portion = this.round(res, 2);
            this.toggledformeat.forEach(element => {
                element.share_kilogram = portion;
            });
            // let keys = Object.keys(this.meats);
            // for(const key in keys) {
            //     this.meats[key].share_kilogram = portion;
            // }
            this.checkTotal();
        },
        checkTotal() { // fixa this.meats till this.toggledformeats
            
            this.toggleupdatearray();
            this.togglecreatearray();
            this.toggledeletearray();
            this.totalmeat = this.round(this.toggledformeat.reduce((t, {share_kilogram}) => t + share_kilogram, 0) + this.waist, 1);

            this.checkChanges();
        },
        round(value, decimals) {
            return Math.round((value + Number.EPSILON) * 10**decimals) / 10**decimals;
        },
        huntername(_id) {
            // console.log("huntername->_id ", _id);
            let res = ""

            // eftersom att anonhunter inte finns med i this.hunters
            // måste man kolla om _id tillhör anonhunter först.
            // om id är samma som anonhunter returnera 'Gäst'
            if(_id == this.anonhunter[0].id) {
                res = 'Gäst';
            } else { // annars plocka fram användaren
                // var user = this.toggledformeat.filter(obj => {
                //     // console.log("toggledformeat.filter->obj", obj);
                //     return obj.id === _id;
                // });
                var user = this.hunters.filter(obj => {
                    return obj.id === _id;
                });
                // console.log("huntermane->user", user);
                // Finns inte användaren så innebär det att köttet ej är tilldelat
                // annars returnera användarens namn.
                if(!user[0]){
                    res = "Ej satt";
                } else if(_id != this.anonhunter[0].id) {
                    res = user[0].firstname +" "+ user[0].lastname;
                }
            }
            return res
        },
        meetAll() {
            // console.log(this.hunters);
            let active_hunters = this.hunters.filter(obj => {
                return obj.occupation == "hunter" && (obj.role == "admin" || obj.role == "user");
            });
            active_hunters.forEach((hunter) => {
                this.togglemeat(hunter);
            });
            
        },
        isToggledForMeat(id) {
            let result = false;

            let meat = this.toggledformeat.filter(obj => {
                // console.log("isToogledForMeat - filter-> obj.user_id: ", obj.user_id);
                // console.log("isToogledForMeat - id: ", id)
                return obj.user_id === id;
            });
            // console.log("isToggledForMeat->user[0].user_id: ", user[0].user_id); 
            if (meat.length > 0) {
                result = true;
            }

            // console.log("isToggledForMeat->result: ", result);
            return result;
        },
        hunter_has_meat(_id) {
            console.log(_id);
            let res = false;

            // eftersom att anonhunter inte finns med i this.hunters
            // måste man kolla om _id tillhör anonhunter först.
            // om id är samma som anonhunter returnera 'Gäst'
            if(_id == this.anonhunter[0].id) {
                res = true;
            } else { // annars plocka fram användaren
                var user = this.meats.filter(obj => {
                    return obj.user_id === _id;
                });

                // Finns inte användaren så innebär det att köttet ej är tilldelat
                // annars returnera användarens namn.
                if(!user[0]){
                    res = false;
                } else if(_id != this.anonhunter[0].id) {
                    res = true;
                }
            }
            console.log("res", res);
            return res
        },
        toggleActiveStateH() {
            this.activeH = true;
            this.activeW = false;
            this.activeM = false;
        },
        toggleActiveStateW() {
            this.activeH = false;
            this.activeW = true;
            this.activeM = false;
        },
        toggleActiveStateM() {
            this.activeH = false;
            this.activeW = false;
            this.activeM = true;
        },
        setShooter(shooter) {
            this.shooterSelected = shooter;
            this.shooterModal = false;
            this.checkChanges();
        },
        setReporter(reporter) {
            this.reporterSelected = reporter;
            this.reporterModal = false;
            this.checkChanges();
        },
        setKindofhunt(kindofhunt) {
            this.kindofhuntSelected = kindofhunt;
            this.kindofhuntModal = false;
            this.checkChanges();
        },
        shooterreportercheck() {
            let unchanged = true;
            if(this.shooterSelected.id !== this.originshooter.id) {
                this.unchanged = false;
            } else if(this.reporterSelected.id !== this.originreporter.id) {
                this.unchanged = false;
            } else if(this.kindofhuntSelected != this.originkindofhunt) {
                this.unchanged = false;
            }
            return unchanged;
        },
        setArea(area) {
            // area är objektet
            this.areaSelected = area;
            this.areaModal = false;
            this.checkChanges();
        },
        setSpecies(species) {
            this.speciesSelected = species;
            this.speciesModal = false;
            this.checkSpeciestype();
            if(!this.points()) {
                this.pointsSelected = null;
            }
            if(!this.antlers()) {
                this.antlersSelected = null;
            }
            this.checkChanges();
        },
        setSpeciesType(speciestype) {
            this.speciestypeSelected = speciestype;
            this.speciestypeModal = false;
            this.checkSpeciestype();
            if(!this.points()) {
                this.pointsSelected = null;
            }
            if(!this.antlers()) {
                this.antlersSelected = null;
            }
            this.checkChanges();
        },
        checkKilldate() {
            let thenow = Date.now();
            this.thekilldate = new Date(this.killdateSelected);
            if(this.thekilldate >= thenow) {
                this.wrongkilldate = true;
                this.killdateset = false;
            } else {
                this.wrongkilldate = false;
                this.killdateset = true;
            }
            if(this.killdateSelected == "" || this.killdateSelected == null) {
                this.wrongkilldate = true;
                this.killdateset = false;
            }
            this.checkChanges();
        },
        checkPlaceChanges() {
            if(this.placeSelected == "") {
                this.placeSelected = null;
            }

            if(this.placeSelected !== this.originplace) {
                this.placechanged = true;
            } else {
                this.placechanged = false;
            }
            this.checkChanges();
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
        checkSpeciestype() {
            if(this.speciesSelected == 'Älg') {
                if(this.elkspeciestypes.includes(this.speciestypeSelected)) {
                    this.wrongspeciestype = false;
                } else {
                    this.wrongspeciestype = true;
                }
            } else if(this.speciesSelected == 'Rådjur') {
                if(this.roedeerspeciestypes.includes(this.speciestypeSelected)) {
                    this.wrongspeciestype = false;
                } else {
                    this.wrongspeciestype = true;
                }
            } else if(this.speciesSelected == 'Vildsvin') {
                if(this.boarspeciestypes.includes(this.speciestypeSelected)) {
                    this.wrongspeciestype = false;
                } else {
                    this.wrongspeciestype = true;
                }
            } else if(this.speciesSelected == 'Dovvilt' || this.speciesSelected == 'Kronvilt') {
                if(this.krondovspeciestypes.includes(this.speciestypeSelected)) {
                    this.wrongspeciestype = false;
                } else {
                    this.wrongspeciestype = true;
                }
            }
        },
        krondov(s) {
            let isKronvilt, isDovvilt;
            isKronvilt = (s === "Kronvilt");
            isDovvilt = (s === "Dovvilt");
            this.kron = ((s === "Kronvilt") || (s === "Dovvilt"));
            return isKronvilt || isDovvilt;
        },
        points() {
            let isTjur = this.speciestypeSelected == 'Tjur';
            let isKronvilt = this.speciesSelected == "Kronvilt";
            let isHjort = this.speciestypeSelected == "Hjort";
            let isKronviltHjort = (isKronvilt && isHjort);

            return (isTjur || isKronviltHjort);
        },
        pointsChanged() {
            if(this.pointsSelected == "") {
                this.pointsSelected = null;
            }
            this.checkChanges()
        },
        antlers() {
            let isDovvilt = this.speciesSelected == "Dovvilt";
            let isHjort = this.speciestypeSelected == "Hjort";
            let isDovviltHjort = (isDovvilt && isHjort);

            return isDovviltHjort;
        },
        setAntlers(antler) {
            this.antlersSelected = antler;
            this.antlersModal = false;
            this.checkChanges();
        },
        toImagesView() {
            if(!this.untouched) {
                if( confirm('Det finns osparad data som går förlorad om du lämnar sidan. Vill du fortsätta?')) {
                    window.location = this.imageUrl;
                }
            } else {
                window.location = this.imageUrl;
            }
        },
        backToKillreportIndex() {
            if(!this.untouched) {
                if( confirm('Det finns osparad data som går förlorad om du lämnar sidan. Vill du fortsätta?')) {
                    window.location = this.indexUrl;
                }
            } else {
                window.location = this.indexUrl;
            }
            
        },
        cardbodycolorTimeandPlace() {
            let cardborderclass = 'cardborder';
            if(this.killdateSelected != this.originkilldate || this.areaSelected.id !== this.originarea.id || this.placeSelected !== this.originplace) {
                cardborderclass = 'cardborderchanged';
            }
            if(this.wrongkilldate) {
                cardborderclass = 'cardbordererror';
            }

            return cardborderclass;
        },
        cardbodycolorAnimal() {
            let cardborderclass = 'cardborder';
            if(this.speciesSelected != this.originSpecies|| this.speciestypeSelected != this.originSpeciestype || this.pointsSelected !== this.originPoints || this.antlersSelected != this.originAntlers) {
                cardborderclass = 'cardborderchanged';
            }
            if(this.wrongspeciestype) {
                cardborderclass = 'cardbordererror';
            }

            return cardborderclass;
        },
        cardbodycolorliveweight() {
            let live_weight_changed = this.live_weightSelected != this.originlive_weight;
            let aprox_live_weight_changed = this.aprox_live_weightSelected != this.originaprox_live_weight;

            return (live_weight_changed || aprox_live_weight_changed);
        },
        cardbodycolorpassadweight() {
            let passad_weight_changed = this.passad_weightSelected != this.originpassad_weight;
            let aprox_passad_weight_changed = this.aprox_passad_weightSelected != this.originaprox_passad_weight;

            return (passad_weight_changed || aprox_passad_weight_changed);
        },
        cardbodycolorcarcassweight() {
            let carcass_weight_changed = this.carcass_weightSelected != this.origincarcass_weight;
            let aprox_carcass_weight_changed = this.aprox_carcass_weightSelected != this.originaprox_carcass_weight;

            return (carcass_weight_changed || aprox_carcass_weight_changed);
        },
        cardbodycolorcutweight() {
            let cut_weight_changed = this.cut_weightSelected != this.origincut_weight;

            return cut_weight_changed;
        },
        cardbodycolorheartweight() {
            let heart_weight_changed = this.heart_weightSelected != this.originheart_weight;

            return heart_weight_changed;
        },
        dateinputcolor() {
            let inputclass = '';
            if(this.killdateSelected != this.originkilldate) {
                inputclass = 'changedinput';
            }
            if(this.wrongkilldate) {
                inputclass = 'error';
            }

            return inputclass;
        },
        speciestypeinputcolor() {
            let inputclass = '';
            if(this.speciestypeSelected != this.originSpeciestype) {
                inputclass = 'changedinput';
            }
            if(this.wrongspeciestype) {
                inputclass = 'error';
            }

            return inputclass;
        },
        checkliveweightchanges() {
            if(this.live_weightSelected == "") {
                this.live_weightSelected = null;
            }
            this.checkChanges();
        },
        checkaproxliveweightchanges() {
            if(this.aprox_live_weightSelected == "") {
                this.aprox_live_weightSelected = null;
            }
            this.checkChanges();
        },
        checkpassadweightchanges() {
            if(this.passad_weightSelected == "") {
                this.passad_weightSelected = null;
            }

            this.checkChanges();
        },
        checkaproxpassadweightchanges() {
            if(this.aprox_passad_weightSelected == "") {
                this.aprox_passad_weightSelected = null;
            }

            this.checkChanges();
        },
        checkcarcassweightchanges() {
            if(this.carcass_weightSelected == "") {
                this.carcass_weightSelected = null;
            }

            this.checkChanges();
        },
        checkaproxcarcassweightchanges() {
            if(this.aprox_carcass_weightSelected == "") {
                this.aprox_carcass_weightSelected = null;
            }

            this.checkChanges();
        },
        checkcutweightchanges() {
            if(this.cut_weightSelected == "") {
                this.cut_weightSelected = null;
            }

            this.checkChanges();
        },
        checkheartweightchanges() {
            if(this.heart_weightSelected == "") {
                this.heart_weightSelected = null;
            }

            this.checkChanges();
        },
        checkChanges() {

            if(this.shooterSelected.id !== this.originshooter.id) {
                this.untouched = false;
            } else if(this.reporterSelected.id !== this.originreporter.id) {
                this.untouched = false;
            } else if(this.areaSelected.id !== this.originarea.id) {
                this.untouched = false;
            } else if(this.placeSelected !== this.originplace) {
                this.untouched = false;
            } else if(this.kindofhuntSelected != this.originkindofhunt) {
                this.untouched = false;
            } else if(this.killdateSelected != this.originkilldate) {
                this.untouched = false;
            } else if(this.speciesSelected != this.originSpecies) {
                this.untouched = false;
            } else if(this.speciestypeSelected != this.originSpeciestype) {
                this.untouched = false;
            } else if(this.pointsSelected != this.originPoints) {
                this.untouched = false;
            } else if(this.antlersSelected != this.originAntlers) {
                this.untouched = false;
            } else if(this.live_weightSelected != this.originlive_weight) {
                this.untouched = false;
            } else if(this.aprox_live_weightSelected != this.originaprox_live_weight) {
                this.untouched = false;
            } else if(this.passad_weightSelected != this.originpassad_weight) {
                this.untouched = false;
            } else if(this.aprox_passad_weightSelected != this.originaprox_passad_weight) {
                this.untouched = false;
            } else if(this.carcass_weightSelected != this.origincarcass_weight) {
                this.untouched = false;
            } else if(this.aprox_carcass_weightSelected != this.originaprox_carcass_weight) {
                this.untouched = false;
            } else if(this.cut_weightSelected != this.origincut_weight) {
                this.untouched = false;
            } else if(this.heart_weightSelected != this.originheart_weight) {
                this.untouched = false;
            } else if(this.delete_from_toggledformeatfromstart.length != 0) {
                this.untouched = false;
            } else if(this.update_from_toggledformeatfromstart.length != 0) {
                this.untouched = false;
            } else if(this.create_from_toggledformeatfromstart.length != 0) {
                this.untouched = false;
            } else if(this.waist != this.orginalwaste_weight) {
                this.untouched = false;
            } else if(this.waste_notes != this.orginalwaste_notes) {
                this.untouched = false;
            } else {
                this.untouched = true;
            }

            // this.untouched = true;
            // if(this.shooterSelected.id !== this.originshooter.id) {
            //     this.untouched = false;
            // }
            // if(this.reporterSelected.id !== this.originreporter.id) {
            //     this.untouched = false;
            // }
            // if(this.areaSelected.id !== this.originarea.id) {
            //     this.untouched = false;
            // }
            // if(this.kindofhuntSelected != this.originkindofhunt) {
            //     this.untouched = false;
            // }
            // if(this.killdateSelected != this.originkilldate) {
            //     this.untouched = false;
            // }
            // if(this.speciesSelected != this.originSpecies) {
            //     this.untouched = false;
            // }
            // if(this.speciestypeSelected != this.originSpeciestype) {
            //     this.untouched = false;
            // }
            // if(this.pointsSelected != this.originPoints) {
            //     console.log("KOMMER TILL POINTS");
            //     this.untouched = false;
            // }
            // if(this.antlersSelected != this.originAntlers) {
            //     this.untouched = false;
            // }
        },
        undoChanges() {
            this.shooterSelected = this.originshooter;
            this.reporterSelected = this.originreporter;
            this.areaSelected = this.originarea;
            this.placeSelected = this.originplace;
            this.killdateSelected = this.originkilldate;
            this.kindofhuntSelected = this.originkindofhunt;
            this.speciesSelected = this.originSpecies;
            this.speciestypeSelected = this.originSpeciestype;
            this.pointsSelected = this.originPoints;
            this.antlersSelected = this.originAntlers;

            this.live_weightSelected = this.originlive_weight;
            this.aprox_live_weightSelected = this.originaprox_live_weight;
            this.passad_weightSelected = this.originpassad_weight;
            this.aprox_passad_weightSelected = this.originaprox_passad_weight;
            this.carcass_weightSelected = this.origincarcass_weight;
            this.aprox_carcass_weightSelected = this.originaprox_carcass_weight;
            this.cut_weightSelected = this.origincut_weight;
            this.heart_weightSelected = this.originheart_weight;
            this.waist = this.orginalwaste_weight;

            this.wrongkilldate = false;
            this.wrongspeciestype = false;

            this.placechanged = false;

            this.untouched = true;

            this.undoModal = false;

            this.delete_from_toggledformeatfromstart = [];
            this.create_from_toggledformeatfromstart = [];
            this.update_from_toggledformeatfromstart = [];

            this.setToggledAtStart();
            this.checkTotal();
            
        },
        engspecies() {
            let value = null;
            if (this.speciesSelected == 'Älg') {
                value = 'moose';
            } else if (this.speciesSelected == 'Kronvilt') {
                value = 'reddeer';
            } else if (this.speciesSelected == 'Dovvilt') {
                value = 'fallowdeer';
            } else if (this.speciesSelected == 'Rådjur') {
                value = 'roedeer';
            } else if (this.speciesSelected == 'Vildsvin') {
                value = 'boar';
            }

            return value;
        },
        age(){
            let value = null;
            if (this.speciestypeSelected == 'Tjur' || this.speciestypeSelected == 'Ko' || this.speciestypeSelected == 'Kviga') {
                value = 'adult';
            } else if (this.speciestypeSelected == 'Hjort' || this.speciestypeSelected == 'Hind' || this.speciestypeSelected == 'Smalhind'){
                value = 'adult';
            } else if (this.speciestypeSelected == 'Bock' || this.speciestypeSelected == 'Get' || this.speciestypeSelected == 'Smaldjur'){
                value = 'adult';
            } else if (this.speciestypeSelected == 'Galt' || this.speciestypeSelected == 'Sugga' || this.speciestypeSelected == 'Gylta'){
                value = 'adult';
            } else if (this.speciestypeSelected == 'Obestämt vuxet hondjur') {
                value = 'adult';
            } else {
                value = 'calf';
            }

            return value;
        },
        sex() {
            let value = null;
            if (this.speciestypeSelected == 'Tjur' || this.speciestypeSelected == 'Tjurkalv') {
                value = 'male';
            } else if (this.speciestypeSelected == 'Ko' || this.speciestypeSelected == 'Kviga' || this.speciestypeSelected == 'Kvigkalv') {
                value = 'female';
            } else if (this.speciestypeSelected == 'Hjort' || this.speciestypeSelected == 'Hjortkalv') {
                value = 'male';
            } else if (this.speciestypeSelected == 'Hind' || this.speciestypeSelected == 'Smalhind' || this.speciestypeSelected == 'Hindkalv') {
                value = 'female';
            } else if (this.speciestypeSelected == 'Bock' || this.speciestypeSelected == 'Bockkilling') {
                value = 'male';
            } else if (this.speciestypeSelected == 'Get' || this.speciestypeSelected == 'Smaldjur' || this.speciestypeSelected == 'Getkilling') {
                value = 'female';
            } else if (this.speciestypeSelected == 'Galt' || this.speciestypeSelected == 'Galtkulting') {
                value = 'male';
            } else if (this.speciestypeSelected == 'Sugga' || this.speciestypeSelected == 'Gylta' || this.speciestypeSelected == 'Suggkulting') {
                value = 'female';
            } else if (this.speciestypeSelected == 'Obestämt vuxet hondjur') {
                value = 'female';
            }

            return value;
        },
         set_report_status(){
            this.report_status = 'green';
            if(this.speciestypeSelected == 'unknown') {
                console.log("REPORT_STATUS: SPECIES = UNKNOWN");
                this.report_status = 'yellow';
            }

            // Status Gul om inte skytt satt
            if(this.shooterSelected.id == this.anonhunter[0].id) {
                console.log("REPORT_STATUS: SHOOTER = ANON");
                this.report_status = 'yellow';
            }

            // Status Gul om det saknas slaktvikt eller uppskattad slaktvikt
            if( (this.carcass_weightSelected == null) && (this.aprox_carcass_weightSelected == null) ) {
                console.log("REPORT_STATUS: WEIGHT NOT SET");
                this.report_status = 'yellow';
            }


            let smaris = this.areas.filter( obj => {
                return obj.area_name == 'Småris'
            });

            console.log("smaris[0].id: ", smaris[0].id);
            // För Småris gäller att även köttet måste vara tilldelat annars status gul
            if(this.areaSelected.id == smaris[0].id) {

                console.log("this.toggledformeat.length: ", this.toggledformeat.length);
                // Status Gul om köttilldelningen är EJ SATT    
                if( this.toggledformeat.length == 0 ) {
                    console.log("REPORT_STATUS: NO MEAT ALLOCATION");
                    this.report_status = 'yellow';
                }
                
            }

            if(this.report_status == 'green') {
                this.locked = 'yes';
            } else {
                this.locked = 'no';
            }

        },
        toggleReportLock() {
            let lock_value = this.killreport.locked == 'yes' ? 'no' : 'yes';
            let lock_request = {
                'locked': lock_value
            };

            console.log("lock_value: ", lock_value);
            axios.post(this.killreportUrl, lock_request)
                .then(response => {
                    window.location.reload();
                })
                .catch(error => {
                    console.log("KILLREPORT UPDATE ERROR:");
                    console.log(error);
                });

        },
        saveChanges() {
            // Håller koll på om köttet ändrats så att man kan skicka mail när det är så
            let meat_changed = false;

            let animalfields, killreportfields, areaidselected;
            areaidselected = this.areaSelected.id;
            // console.log(areaidselected);
            animalfields = {
                'id': this.animal.id,
                'shooter_id': this.shooterSelected.id,
                'species': this.speciesSelected,
                'speciestype': this.speciestypeSelected,
                'engspecies': this.engspecies(),
                'sex': this.sex(),
                'age': this.age(),
                'live_weight': this.live_weightSelected == null ? null : parseFloat(this.live_weightSelected),
                'aprox_live_weight': this.aprox_live_weightSelected == null ? null : parseFloat(this.aprox_live_weightSelected),
                'passad_weight': this.passad_weightSelected == null ? null : parseFloat(this.passad_weightSelected),
                'aprox_passad_weight': this.aprox_passad_weightSelected == null ? null : parseFloat(this.aprox_passad_weightSelected),
                'carcass_weight': this.carcass_weightSelected == null ? null : parseFloat(this.carcass_weightSelected),
                'aprox_carcass_weight': this.aprox_carcass_weightSelected == null ? null : parseFloat(this.aprox_carcass_weightSelected),
                'cut_weight': this.cut_weightSelected == null ? null : parseFloat(this.cut_weightSelected),
                'heart_weight': this.heart_weightSelected == null ? null : parseInt(this.heart_weightSelected),
                'waste': this.waist,
                'waste_notes': this.waste_notes,
                'antlers': this.antlersSelected == null ? null : this.antlersSelected,
                'points': this.pointsSelected == null ? null : parseInt(this.pointsSelected)
            };
            // console.log("ANIMALFIELDS:")
            // console.log(animalfields);
            this.set_report_status();

            killreportfields = {
                'reporter_id': this.reporterSelected.id,
                'shooter_id': this.shooterSelected.id,
                'kindofhunt': this.kindofhuntSelected,
                'killdate': this.killdateSelected,
                'season': this.setSeason(this.killdateSelected),
                'area_id': this.areaSelected.id,
                'place': this.placeSelected == null ? null : this.placeSelected,
                'longitud': null,
                'latitud': null,
                'report_status': this.report_status,
                'locked': this.locked,
            };

            
            // console.log(killreportfields);
            console.log("KILLREPORTFIELDS:")
            console.log(killreportfields);

            // console.log('http://localhost/pwww/jaktsite/public/animals/83/update');
            axios.post(this.animalUrl, animalfields)
                .then(response => {
        

                })
                .catch(error => {
                    console.log("ANIMAL UPDATE ERROR:");
                    console.log(error);
                });
            



            // Om det finns någon jägare att uppdatera görs det här
            if( this.update_from_toggledformeatfromstart.length > 0) {
                console.log("Nu skall det uppdateras meat-tabell");
                this.update_from_toggledformeatfromstart.forEach( (meat) => {
                    var meat_update_url = this.meatUrl+'/'+meat['id']+'/update';
                    axios.patch(meat_update_url, meat)
                        .then(response => {
                            console.log("UPDATED: ", meat);
                        })
                        .catch(error => {
                            console.log("MEAT UPDATE ERROR");
                            console.log(error);
                        });
                });

                // Håller koll på om köttet ändrats så att man kan skicka mail när det är så
                meat_changed = true;
            }

            // Om det finns någon jägare som skall läggas till görs det här
            if( this.create_from_toggledformeatfromstart.length > 0) {


                console.log("Nu skall det läggas till i meat-tabellen");
                this.create_from_toggledformeatfromstart.forEach( (meat, index) => {
                    var meat_store_url = this.meatUrl+'/store';



                    // nu är problemet att det alltid är skapat en null rad för varje killreport. Därför måste
                    // det i dessa fall uppdateras den första raden och de eventuellt följande raderna skapas nya.
                    if( this.toggledformeatfromstart.length === 0 && index === 0) {
                        
                        var meat_update_url = this.meatUrl+'/'+this.meats[0].id+'/update';
                        axios.patch(meat_update_url, meat)
                            .then(response => {
                                console.log("UPDATED: ", meat);
                            })
                            .catch(error => {
                                console.log("MEAT UPDATE ERROR");
                                console.log(error);
                            });
                    } else {

                        // ta eventuellt med notes när det läggs till i vyn.
                        var meat_to_store = {
                            killreport_id: meat['killreport_id'],
                            share_kilogram: meat['share_kilogram'],
                            share_lot: meat['share_lot'],
                            user_id: meat['user_id']
                        }
                        
                        axios.post(meat_store_url, [meat_to_store])
                            .then(response => {
                                console.log("CREATED MEAT");
                                console.log(meat);
                            })
                            .catch(error => {
                                console.log("MEAT CREATE ERROR");
                                console.log(error);
                            });
                    }
                    
                    
                    
                    
                });

                // Håller koll på om köttet ändrats så att man kan skicka mail när det är så
                meat_changed = true;
            }

            // När man skall ta bort. Tar man bort allt så skall ändå en nullrad finnas kvar. Så ta bort alla utom sista och uppdatera sista till null.
            if( this.delete_from_toggledformeatfromstart.length > 0 ) {
                // kollar ifall det skall lämnas helt tomt. Det kan man göra genom att kolla om antalet från början är lika många som det skall tas bort. Samtidigt
                // som det inte skapas några nya.
                var delete_all = ((this.toggledformeatfromstart.length == this.delete_from_toggledformeatfromstart.length) && (this.create_from_toggledformeatfromstart.length == 0));
                console.log("this.delete_from_toggledformeatfromstart.length: ", this.delete_from_toggledformeatfromstart.length);
                console.log("this.toggledformeatfromstart.length: ", this.toggledformeatfromstart.length);
                console.log("this.create_from_toggledformeatfromstart.length: ", this.create_from_toggledformeatfromstart.length);
                console.log("delete_all: ", delete_all);



                // Börja med att ta bort alla som är i tabort-listan
                this.delete_from_toggledformeatfromstart.forEach( (meat, index) => {

                    var meat_delete_url = this.meatUrl+'/'+meat['id']+'/delete';
                    axios.delete(meat_delete_url, meat)
                        .then(response => {
                            console.log("Deleted");
                            console.log(meat);
                        })
                        .catch(error => {
                            console.log("MEAT DELETE ERROR");
                            console.log(error);
                        });
                });

                // OM sedan det var så att man tog bort alla jägare så lägg till en meat med null i allt utom killreport_id
                if( delete_all ) {
                    console.log("deleted all");
                    var meat_store_url = this.meatUrl+'/store';
                    var meat_to_store = {
                        killreport_id: this.meats[0].killreport_id,
                        share_kilogram: null,
                        share_lot: null,
                        user_id: null
                    }
                    // console.log('meat_to_store');
                    // console.log(meat_to_store);
                    
                    axios.post(meat_store_url, [meat_to_store])
                        .then(response => {
                            console.log("CREATED MEAT");
                            console.log(meat);
                        })
                        .catch(error => {
                            console.log("MEAT CREATE ERROR");
                            console.log(error);
                        });
                }

                // Håller koll på om köttet ändrats så att man kan skicka mail när det är så
                meat_changed = true;

            }


            axios.post(this.killreportUrl, killreportfields)
                .then(response => {
                    console.log("WINDOWLOCADEDRELOAD")
                    window.location.reload();
                })
                .catch(error => {
                    
                    console.log("KILLREPORT UPDATE ERROR:");
                    console.log(error);
                    // window.location.reload();
                    // console.log(this.killreportUrl);
                    // console.log(killreportfields)
                });

            

            console.log("this.toggledformeat under saving process");
            console.log(this.toggledformeat);
            this.toggledformeat.forEach(obj => {
                console.log(obj.user_id);
            });


            // if(meat_changed) {

            //     console.log("mailurl: ", this.mailBaseUrl+"/meat");
            //     axios.post(this.mailBaseUrl+"/meat")
            //         .then(response => {

            //         })
            //         .catch(error => {
            //             console.log("MEAT MAIL ERROR: ", error);
            //         })

            // }
        },
        deleteReport() {
            axios.post(this.killreportDeleteUrl, this.killreport)
                .then(response => {
                    console.log("Killreport deleted");
                    window.location = this.indexUrl;
                })
                .catch(error => {
                    console.log("Killreport delete error: ", error);
                })
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
.error > input[type=text]{
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
    border-left: 10px solid #d0b76d !important;
    /* border-left: 10px solid #e8a167!important; */
}
.cardbordererror{
    /* border-left: 10px solid red; */
    border-left: 10px solid #d85f5b;
}
.cardborderchanged {
    /* border-left: 10px solid #187eb9; */
    border-left: 10px solid #59698d;
}
.changedinput > input {
    /* color:#b340b3; */
    color:#000000;
}
.changedinput > textarea {
    /* color: #b340b3; */
}
.bg-blue-color {
    /* background-color: #1c2331; */
    /* background-color: #59698d; */
    /* border-bottom: 5px solid #59698d; */
    background-color: white;
    /* background-color: #1c2331; */
    color: black;
    /* border-top: 2px solid #59698d; */
    /* border-bottom: 2px solid #59698d; */

}
.btncolor{
    background-color: #bd794b;
}
/* .errorheader {
    background-color: #1c2331;
    color: white;
    border-bottom: 5px solid red;
} */
.errorheader {
    background-color: white;
    /* background-color: #f1f1f1; */
    color: black;
    border-left: 10px solid red;
    /* border-top: 2px solid red; */
    /* border-bottom: 2px solid red; */
}
.meatcardbordererror {
    border-left: 10px solid #d85f5b;
}
.par {
    width: 100%;
    object-fit: cover;
    max-height:50vh;

}
.parallax-container {
  position: relative;
  width: 100%;
  height: 100%;
  overflow-x: hidden;
  overflow-y: scroll;
  perspective: 8px;
  perspective-origin: 0%;
  display: flex;
}
.background {
  position: absolute;
  top: 0;
  left: 0;
  width: 100%;
  height: 100%;
  transform: translateZ(0px);
}

.foreground {
  margin-top: auto;
  margin-bottom: 50px;
  transform-origin: 0;
  transform: translateZ(1px)scale(0.926);
}

.divide_btn {
    border-bottom: 3px solid #ff2300;
    padding-bottom: 3px !important;
}

.meatallocationheader {
    background-color: #323a4e;
    color: white;
}

.totally_allocated_error {
    color: red;
}
.weight-inputs {
    border-bottom: 1px solid #d0d0d0;
}

</style>