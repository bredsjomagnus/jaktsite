<template>
   <div>

        <div>

            <div class="d-flex flex-row justify-content-around" style="margin-top:-20px">
                <mdb-card class='w-100' color="unique-color-dark">
                    <mdb-card-text class="d-flex justify-content-center">Rapportkort</mdb-card-text>
                </mdb-card>
            </div>

            <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                <mdb-btn-group size="sm">
                    <mdb-btn :color="untouched ? 'mdb-color' : 'purple'" @click.native="saveChanges" :disabled="savable" size="sm"><mdb-icon icon="save"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="images" size="sm"><mdb-icon icon="images"/></mdb-btn>
                </mdb-btn-group>
            </div>
            <!-- </mdb-btn-toolbar> -->
                       <!-- <mdb-icon icon="balance-scale"/> -->
            <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                <mdb-btn color="mdb-color" @click.native="backToKillreportIndex" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateH" :active="activeH" size="sm">Jakt</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateW" :active="activeW" size="sm">Vikter</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateM" :active="activeM" size="sm">Kött </mdb-btn>
                </mdb-btn-group>
                <mdb-btn color="mdb-color" @click.native="undoModal = true" size="sm"><mdb-icon icon="undo"/></mdb-btn>
                
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

        <div v-if="activeH">
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
                                    <mdb-btn v-if="authUser.role == 'admin'" class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="reporterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <!-- skytt -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="shooterSelected.id !== originshooter.id ? 'changedinput' : ''" type="text" class="w-100" label="Skytt" v-model="this.shooterName" />
                                <p v-if="shooterSelected.id !== originshooter.id" class="inputmsg">Urspr. skytt: {{this.originshooterName}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="shooterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <!-- typ av jakt -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="kindofhuntSelected != originkindofhunt ? 'changedinput': ''" type="text" class="w-100" label="Sorts jakt" v-model="this.kindofhuntSelected" />
                                <p v-if="kindofhuntSelected != originkindofhunt" class="inputmsg">Urspr. sort: {{this.originkindofhunt}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="kindofhuntModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
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
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="areaModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
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
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="speciesModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input disabled :class="speciestypeinputcolor()" type="text" class="w-100" label="Djurkvalificering" v-model="speciestypeSelected" />
                                <p class="errormsg" v-if="wrongspeciestype">Ogiltig djurkvalificering</p>
                                <p v-if="speciestypeinputcolor() == 'changedinput'" class="inputmsg">Urspr. djurkvalif.: {{this.originSpeciestype}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="speciestypeModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
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
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="antlersModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                </mdb-card-body>
            </mdb-card>
       </div>

       <div v-else-if="activeW">
           <mdb-card>
                <mdb-card-body :class="cardbodycolorliveweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2">
                        <mdb-input :class="live_weightSelected != originlive_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägd levandevikt" v-model="live_weightSelected" @change="checkliveweightchanges"/>
                        <p v-if="live_weightSelected != originlive_weight" class="inputmsg" >Urspr.: {{this.originlive_weight}}</p>
                        <mdb-input :class="aprox_live_weightSelected != originaprox_live_weight ? 'changedinput' : ''" type="number" step="0.1" label="Uppsk. levandevikt" v-model="aprox_live_weightSelected" @change="checkaproxliveweightchanges"/>
                        <p v-if="aprox_live_weightSelected != originaprox_live_weight" class="inputmsg" >Urspr.: {{this.originaprox_live_weight}}</p>
                    </div>
                </mdb-card-body>
            </mdb-card>
            <mdb-card class="mt-2">
            <mdb-card-body :class="cardbodycolorpassadweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2">
                        <mdb-input :class="passad_weightSelected != originpassad_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägd passad vikt" v-model="passad_weightSelected" @change="checkpassadweightchanges"/>
                        <p v-if="passad_weightSelected != originpassad_weight" class="inputmsg" >Urspr.: {{this.originpassad_weight}}</p>
                        <mdb-input :class="aprox_passad_weightSelected != originaprox_passad_weight ? 'changedinput' : ''" type="number" step="0.1" label="Uppsk. passad vikt" v-model="aprox_passad_weightSelected" @change="checkaproxpassadweightchanges"/>
                        <p v-if="aprox_passad_weightSelected != originaprox_passad_weight" class="inputmsg" >Urspr.: {{this.originaprox_passad_weight}}</p>
                    </div>
                </mdb-card-body>
            </mdb-card>

            <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorcarcassweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2">
                        <mdb-input :class="carcass_weightSelected != origincarcass_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägd slaktvikt" v-model="carcass_weightSelected" @change="checkcarcassweightchanges"/>
                        <p v-if="carcass_weightSelected != origincarcass_weight" class="inputmsg" >Urspr.: {{this.origincarcass_weight}}</p>
                        <mdb-input :class="aprox_carcass_weightSelected != originaprox_carcass_weight ? 'changedinput' : ''" type="number" step="0.1" label="Uppsk. slaktvikt" v-model="aprox_carcass_weightSelected" @change="checkaproxcarcassweightchanges"/>
                        <p v-if="aprox_carcass_weightSelected != originaprox_carcass_weight" class="inputmsg" >Urspr.: {{this.originaprox_carcass_weight}}</p>
                    </div>
                </mdb-card-body>
            </mdb-card>

            <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorcutweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2">
                        <mdb-input :class="cut_weightSelected != origincut_weight ? 'changedinput' : ''" type="number" step="0.1" label="Vägda styckdetaljer" v-model="cut_weightSelected" @change="checkcutweightchanges"/>
                        <p v-if="cut_weightSelected != origincut_weight" class="inputmsg" >Urspr.: {{this.origincut_weight}}</p>
                    </div>
                </mdb-card-body>
           </mdb-card>

           <mdb-card class="mt-2">
                <mdb-card-body :class="cardbodycolorheartweight() ? 'cardborderchanged' : 'cardborder'">
                    <div class="p-3 mb-2">
                        <mdb-input :class="heart_weightSelected != originheart_weight ? 'changedinput' : ''" type="number" step="0.001" label="Vägd hjärtvikt (kg)" v-model="heart_weightSelected" @change="checkheartweightchanges"/>
                        <p v-if="heart_weightSelected != originheart_weight" class="inputmsg" >Urspr.: {{this.originheart_weight}}</p>
                    </div>
                </mdb-card-body>
          </mdb-card>
       </div>

       <div v-else-if="activeM">
           <mdb-card class="mt-2">
               <mdb-card-body class="cardborder">
                   <mdb-input 
                    v-for="meat in meats" 
                    :key="meat.id"
                        type="Number" :label="huntername(meat.user_id)" v-model="meat.share_kilogram"/>
               </mdb-card-body>
           </mdb-card>
       </div>

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
            'anonhunter',
            'shooter',
            'reporter',
            'area',
            'areas',
            'killreport',
            'meats',
            'animal',
            'indexUrl',
            'animalUrl',
            'killreportUrl'
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
            killdateset: true,
            placechanged: false,
            wrongkilldate: false,
            wrongspeciestype: false,
            originkilldate: this.killreport.killdate.substring(0,10),
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
            elkspeciestypes: ['Tjur', 'Obestämt vuxet hondjur', 'Ko', 'Kviga', 'Tjurkalv', 'Kvigkalv', 'Obestämd kalv'],
            roedeerspeciestypes: ['Bock', 'Obestämt vuxet hondjur', 'Get', 'Smaldjur', 'Bockkilling', 'Getkilling', 'Obestämd killing'],
            boarspeciestypes: ['Galt', 'Obestämt vuxet hondjur', 'Sugga', 'Gylta', 'Galtkulting', 'Suggkulting', 'Obestämd kulting'],
            krondovspeciestypes: ['Hjort', 'Obestämt vuxet hondjur', 'Hind', 'Smalhind', 'Hjortkalv', 'Hindkalv', 'Obestämd kalv']

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
        savable(){
            let notallowed = this.wrongkilldate || this.wrongspeciestype
            return this.untouched || notallowed;
        }
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
        console.log("meats: ");
        console.log(this.meats);

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
        backToKillreportIndex() {
            window.location = this.indexUrl;
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

            this.wrongkilldate = false;
            this.wrongspeciestype = false;

            this.placechanged = false;

            this.untouched = true;

            this.undoModal = false;
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
        saveChanges() {
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
                'waste': null,
                'waste_notes': null,
                'antlers': this.antlersSelected == null ? null : this.antlersSelected,
                'points': this.pointsSelected == null ? null : parseInt(this.pointsSelected)
            };
            // console.log("ANIMALFIELDS:")
            // console.log(animalfields);
            killreportfields = {
                'reporter_id': this.reporterSelected.id,
                'shooter_id': this.shooterSelected.id,
                'kindofhunt': this.kindofhuntSelected,
                'killdate': this.killdateSelected,
                'season': '20/21',
                'area_id': this.areaSelected.id,
                'place': this.placeSelected == null ? null : this.placeSelected,
                'longitud': null,
                'latitud': null,
                'report_status': 'red',
                'locked': 'no'
            };
            // console.log(killreportfields);
            console.log("KILLREPORTFIELDS:")
            console.log(killreportfields);

            // console.log('http://localhost/pwww/jaktsite/public/animals/83/update');
            axios.post(this.animalUrl, animalfields)
                .then(response => {
                    // console.log("ANIMALURL:");
                    // console.log(this.animalUrl);
                    // console.log();
                    // console.log("ANIMALFIELDS");
                    // console.log(animalfields);
                    // console.log();
                    // console.log("ANIMAL UPDATE SUCCESS:");
                    // console.log(response);
                    // console.log("this.killreportUrl");
                    // console.log(this.killreportUrl);
                    // console.log("response ", response);
                  
                })
                .catch(error => {
                    console.log("ANIMAL UPDATE ERROR:");
                    console.log(error);
                });
            axios.post(this.killreportUrl, killreportfields)
                .then(response => {
                    // console.log("KILLREPORT UPDATE SUCCESS:");
                    window.location = response.data.redirect;
                    // console.log("response ", response);
                })
                .catch(error => {
                    console.log("KILLREPORT UPDATE ERROR:");
                    console.log(error);
                });
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
    border-left: 10px solid #59698d;
}
.cardbordererror{
    border-left: 10px solid red;
}
.cardborderchanged {
    /* border-left: 10px solid #187eb9; */
    border-left: 10px solid #8e24aa
}
.changedinput > input {
    color:#b340b3;
}
.changedinput > textarea {
    color: #b340b3;
}
    
</style>