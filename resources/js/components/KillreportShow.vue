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
                    <mdb-btn :color="untouched ? 'mdb-color' : 'purple'" @click.native="saveChanges" :disabled="untouched" size="sm"><mdb-icon icon="save"/></mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="divideMeat" :disabled="missingweights" size="sm"><mdb-icon icon="balance-scale"/></mdb-btn>
                </mdb-btn-group>
            </div>
            <!-- </mdb-btn-toolbar> -->
                       
            <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                <mdb-btn color="mdb-color" @click.native="backToKillreportIndex" size="sm"><mdb-icon icon="chevron-left"/></mdb-btn>
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateH" :active="activeH" size="sm">Jakt</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleActiveStateW" :active="activeW" size="sm">Vikter</mdb-btn>
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
                                <mdb-input :class="reporterSelected.id !== originreporter.id ? 'changedinput' : ''" type="text" class="w-100" label="Rapportör" v-model="this.reporterName" />
                                <p class="inputmsg" v-if="authUser.role == 'admin'">Urspr. rapportör: {{this.originreporterName}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn v-if="authUser.role == 'admin'" class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="reporterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <!-- skytt -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input :class="shooterSelected.id !== originshooter.id ? 'changedinput' : ''" type="text" class="w-100" label="Skytt" v-model="this.shooterName" />
                                <p class="inputmsg">Urspr. skytt: {{this.originshooterName}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                    <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="shooterModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <!-- typ av jakt -->
                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input :class="kindofhuntSelected != originkindofhunt ? 'changedinput': ''" type="text" class="w-100" label="Sorts jakt" v-model="this.kindofhuntSelected" />
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
                <mdb-card-body :class="cardbodycolor()">
                    <mdb-card-title class="d-flex justify-content-center titlecolor p-1">TID & PLATS</mdb-card-title>
                    <mdb-input style="color: red;" :class="dateinputcolor()" type="date" v-model="killdateSelected" @change="checkKilldate"/>
                    <p class="errormsg" v-if="wrongkilldate">Ogiltigt datum</p>
                    <p class="inputmsg" v-else>Urspr. datum: {{this.originkilldate}}</p>
                    <mdb-row>
                        <mdb-col col="9">
                            <mdb-input type="text" v-model="areaSelected.area_name"/>
                            <p class="inputmsg">Urspr. område: {{this.originareaName}}</p>
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
                <mdb-card-body :class="wrongspeciestype ? 'cardbordererror' : 'cardborder'">
                    <mdb-card-title class="d-flex justify-content-center titlecolor p-1">DJUR & HORN/TAGGAR</mdb-card-title>

                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input type="text" class="w-100" label="Djur" v-model="speciesSelected" />
                                <p class="inputmsg">Urspr. djur: {{this.originSpecies}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="speciesModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <mdb-row>
                            <mdb-col col="9">
                                <mdb-input style="color: red;" :class="wrongspeciestype ? 'error' : ''" type="text" class="w-100" label="Djurkvalificering" v-model="speciestypeSelected" />
                                <p class="errormsg" v-if="wrongspeciestype">Ogiltig djurkvalificering</p>
                                <p class="inputmsg" v-else>Urspr. djurkvalif.: {{this.originSpeciestype}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="speciestypeModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                        <mdb-row v-if="points()">
                            <mdb-col col="12">
                                <mdb-input type="number" label="Taggar" v-model="pointsSelected" @change="pointsChanged" />
                                <p class="inputmsg" >Urspr. taggar.: {{this.originPoints}}</p>
                            </mdb-col>
                            
                        </mdb-row>

                        <mdb-row v-if="antlers()">
                            <mdb-col col="9">
                                <mdb-input label="Horn" v-model="antlersSelected" />
                                <p class="inputmsg" >Urspr. horn.: {{this.originAntlers}}</p>
                            </mdb-col>
                            <mdb-col col="2">
                                <mdb-btn class="mt-4 pb-2 pt-2 pl-3 pr-3" color="mdb-color" @click.native="antlersModal = true" size="sm"><mdb-icon icon="edit"/></mdb-btn>
                            </mdb-col>
                        </mdb-row>

                </mdb-card-body>
            </mdb-card>
       </div>

       <div v-else>
           <mdb-card>
                <mdb-card-body class="cardborder">
                    <div class="p-3 mb-2">
                        <mdb-input type="number" step="0.1" label="Levandevikt" v-model="live_weightSelected"/>
                        <mdb-input type="number" step="0.1" label="Uppskattad levandevikt" v-model="aprox_live_weightSelected"/>
                    </div>
                </mdb-card-body>
            </mdb-card>

            <mdb-card class="mt-2">
                <mdb-card-body class="cardborder">
                    <div class="p-3 mb-2">
                        <mdb-input type="number" step="0.1" label="Passad vikt" v-model="passad_weightSelected"/>
                        <mdb-input type="number" step="0.1" label="Uppskattad passad vikt" v-model="aprox_passad_weightSelected"/>
                    </div>
                </mdb-card-body>
            </mdb-card>

            <mdb-card class="mt-2">
                <mdb-card-body class="cardborder">
                    <div class="p-3 mb-2">
                        <mdb-input type="number" step="0.1" label="Slaktvikt" v-model="carcass_weightSelected"/>
                        <mdb-input type="number" step="0.1" label="Uppskattad slaktvikt" v-model="aprox_carcass_weightSelected"/>
                    </div>
                </mdb-card-body>
            </mdb-card>

            <mdb-card class="mt-2">
                <mdb-card-body class="cardborder">
                    <div class="p-3 mb-2">
                        <mdb-input type="number" step="0.1" label="Styckdetaljer" v-model="cut_weightSelected"/>
                    </div>
                </mdb-card-body>
           </mdb-card>

           <mdb-card class="mt-2">
                <mdb-card-body class="cardborder">
                    <div class="p-3 mb-2">
                        <mdb-input type="number" step="0.001" label="Hjärtvikt" v-model="heart_weightSelected"/>
                    </div>
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
            'shooter',
            'reporter',
            'area',
            'areas',
            'killreport',
            'animal',
            'indexUrl'
        ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            activeH: true,
            activeW: false,
            untouched: true,
            missingweights: true,
            shooterSelected: this.shooter,
            reporterSelected: this.reporter,
            killdateSelected: this.killreport.killdate.substring(0,10),
            areaSelected: this.area,
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
            wrongkilldate: false,
            wrongspeciestype: false,
            originkilldate: this.killreport.killdate.substring(0,10),
            originarea: this.area,
            originareaName: this.area.area_name,
            originshooter: this.shooter,
            originreporter: this.reporter,
            originshooterName: this.shooter.firstname + " " + this.shooter.lastname,
            originreporterName: this.reporter.firstname + " " + this.reporter.lastname,
            originkindofhunt: this.killreport.kindofhunt,
            originSpecies: this.animal.species,
            originSpeciestype: this.animal.speciestype,
            originPoints: this.animal.points,
            originAntlers: this.animal.antlers,
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
        toggleActiveStateH() {
            this.activeH = true;
            this.activeW = false;
        },
        toggleActiveStateW() {
            this.activeH = false;
            this.activeW = true;
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
            console.log("kommer hit")
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
        cardbodycolor() {
            let cardborderclass = 'cardborder';
            if(this.killdateSelected != this.originkilldate || this.areaSelected.id !== this.originarea.id) {
                cardborderclass = 'cardborderchanged';
            }
            if(this.wrongkilldate) {
                cardborderclass = 'cardbordererror';
            }

            return cardborderclass;
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
        checkChanges() {
            
            if(this.shooterSelected.id !== this.originshooter.id) {
                this.untouched = false;
            } else if(this.reporterSelected.id !== this.originreporter.id) {
                this.untouched = false;
            } else if(this.areaSelected.id !== this.originarea.id) {
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
            this.killdateSelected = this.originkilldate;
            this.kindofhuntSelected = this.originkindofhunt;
            this.speciesSelected = this.originSpecies;
            this.speciestypeSelected = this.originSpeciestype;
            this.pointsSelected = this.originPoints;
            this.antlersSelected = this.originAntlers;

            this.wrongkilldate = false;
            this.wrongspeciestype = false;

            this.untouched = true;

            this.undoModal = false;
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
    color:#b340b3
}
    
</style>