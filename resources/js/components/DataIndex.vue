<template>
    <mdb-container>

        <!-- </mdb-btn-toolbar> -->
        <div class="d-flex flex-row justify-content-around" style="background-color: rgb(236 236 236); margin-top: -20px;">
            <mdb-btn-group size="sm">
                <mdb-btn color="mdb-color" @click.native="backToUserProfile" size="sm">Min sida</mdb-btn>
                <mdb-btn color="mdb-color" @click.native="backToKillreport_create" size="sm">Rapportera</mdb-btn>
                <mdb-btn color="mdb-color" @click.native="backToKillreport_index" size="sm">Arkivet</mdb-btn>
            </mdb-btn-group>
        </div>
             <!-- <mdb-btn-toolbar> -->
            <div class="d-flex flex-row justify-content-around">
                <mdb-btn-group size="sm">
                    <mdb-btn color="mdb-color" @click.native="toggleToD" :active="activeD" size="sm">Kött</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleToC" :active="activeC" size="sm">Område</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleToA" :active="activeA" size="sm">Fördelning</mdb-btn>

                </mdb-btn-group>
            </div>
            <!-- </mdb-btn-toolbar> -->
        
        
        <!-- MODAL FÖR ATT ÄNDRA KÖTTILLDELNINGEN -->
        <mdb-modal size="sm" :show="meetModal" @close="meetModal = false">
            <mdb-modal-header>
                <mdb-modal-title>{{speciesSelected}}</mdb-modal-title>
            </mdb-modal-header>
            <mdb-modal-body>
                <div class="d-flex flex-row justify-content-center">
                    <div class="custom-control custom-switch" style="width:110px">
                        <input type="checkbox" class="custom-control-input" v-model="showAverageMeat" id="customSwitches">
                        <label v-if="showAverageMeat" class="custom-control-label" for="customSwitches">Snitt</label>
                        <label v-else class="custom-control-label" for="customSwitches">Totalt</label>
                    </div>
                </div>

                <div v-if="this.speciesSelected == 'Älg'">
                    <div v-if="showAverageMeat" class="d-flex justify-content-center w-100">      
                        <table class="table-striped meattable w-100">
                            <tbody>

                                <tr
                                v-for="hunter in meatMooseAverage"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Snitt</td>
                                    <td>{{ averageMeat(meatMooseAverage) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-else class="d-flex justify-content-center w-100">
                        <table class="table-striped meattable w-100">
                            <tbody>

                                <tr
                                v-for="hunter in meatMooseTotal"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Totalt</td>
                                    <td>{{ totalMeat(meatMooseTotal) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div v-if="this.speciesSelected == 'Kronvilt'">
                    <div v-if="showAverageMeat" class="d-flex justify-content-center w-100">  
                        <table class="table-striped meattable w-100">
                            <tbody>

                                <tr
                                v-for="hunter in meatReddeerAverage"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Snitt</td>
                                    <td>{{ averageMeat(meatReddeerAverage) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-else class="d-flex justify-content-center w-100">
                        <table class="table-striped meattable w-100">
                            <tbody>

                                <tr
                                v-for="hunter in meatReddeerTotal"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Totalt</td>
                                    <td>{{ totalMeat(meatReddeerTotal) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div v-if="this.speciesSelected == 'Dovvilt'">
                    <div v-if="showAverageMeat" class="d-flex justify-content-center w-100">  
                        <table class="table-striped meattable w-100">
                            <tbody>

                                <tr
                                v-for="hunter in meatFallowdeerAverage"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Snitt</td>
                                    <td>{{ averageMeat(meatFallowdeerAverage) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-else class="d-flex justify-content-center w-100">
                        <table class="table-striped meattable w-100">
                            <tbody>

                                <tr
                                v-for="hunter in meatFallowdeerTotal"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Totalt</td>
                                    <td>{{ totalMeat(meatFallowdeerTotal) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div v-if="this.speciesSelected == 'Rådjur'">
                    <div v-if="showAverageMeat" class="d-flex justify-content-center w-100">  
                        <table class="table-striped meattable w-100">
                            <tbody>
                                <tr
                                v-for="hunter in meatRoedeerAverage"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Snitt</td>
                                    <td>{{ averageMeat(meatRoedeerAverage) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-else class="d-flex justify-content-center w-100">
                        <table class="table-striped meattable w-100">
                            <tbody>
                            <tr
                                v-for="hunter in meatRoedeerTotal"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Totalt</td>
                                    <td>{{ totalMeat(meatRoedeerTotal) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>

                <div v-if="this.speciesSelected == 'Vildsvin'">
                    <div v-if="showAverageMeat" class="d-flex justify-content-center w-100">  
                        <table class="table-striped meattable w-100">
                            <tbody>
                                <tr
                                v-for="hunter in meatBoarAverage"
                                :key="hunter.id"
                                >   
                                    <td width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Snitt</td>
                                    <td>{{ averageMeat(meatBoarAverage) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                    <div v-else class="d-flex justify-content-center w-100">
                        <table class="table-striped meattable w-100">
                            <tbody>
                                <tr
                                v-for="hunter in meatBoarTotal"
                                :key="hunter.id"
                                >   
                                    <td  width="80%">{{hunter.firstname}} {{hunter.lastname}}</td>
                                    <td>{{hunter.kg}} kg</td>
                                </tr>
                                <tr class="table-sumrow" style="background-color: #dccc9b;">
                                    <td width="80%">Totalt</td>
                                    <td>{{ totalMeat(meatBoarTotal) }} kg</td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </mdb-modal-body>
            <mdb-modal-footer>
                <mdb-btn color="blue-grey" size="sm" @click.native="closeModal">OK!</mdb-btn>
            </mdb-modal-footer>
        </mdb-modal>


        <div v-if="activeD">
            <div class=" mt-3 d-flex justify-content-center">
                <h6>KÖTTFÖRDELNING PER DJURSLAG</h6>
            </div>
            <div class="d-flex justify-content-center">
                <mdb-btn class="species-btn" color="grey" size="lg" @click.native="selectSpecies('Kronvilt')"> KRONVILT </mdb-btn>
            </div>
            <div class="d-flex justify-content-center">
                <mdb-btn class="species-btn" color="grey" size="lg" @click.native="selectSpecies('Dovvilt')"> DOVVILT </mdb-btn>
            </div>
            <div class="d-flex justify-content-center">
                <mdb-btn class="species-btn" color="grey" size="lg" @click.native="selectSpecies('Älg')"> ÄLG </mdb-btn>
            </div>
            <div class="d-flex justify-content-center">
                <mdb-btn class="species-btn" color="grey" size="lg" @click.native="selectSpecies('Vildsvin')"> VILDSVIN </mdb-btn>
            </div>
            <div class="d-flex justify-content-center">
                <mdb-btn class="species-btn" color="grey" size="lg" @click.native="selectSpecies('Rådjur')"> RÅDJUR </mdb-btn>
            </div>

        </div>


        <div v-else-if="activeC">
            <div class="mt-2 justify-content-center">
                <label for="">OMRÅDE:</label>
                <select class="browser-default custom-select" v-model="area">
                    <option v-for="area in areas"
                            :key="area.index"
                            :value="area.name"
                            >
                            {{area.name}}
                    </option>
                   
                    <!-- <option value="Småris" >Småris</option>
                    <option value="Glotterbäck" :disabled="areaDisabled">Glotterbäck</option>
                    <option value="Haddebo" :disabled="areaDisabled">Haddebo</option>
                    <option value="Västerby" :disabled="areaDisabled">Västerby</option>
                    <option value="Nästorp" :disabled="areaDisabled">Nästorp</option>
                    <option value="Pålsboda" :disabled="areaDisabled">Pålsboda</option> -->
                </select>
                <hr>
                <h6 class="mt-3">ANTAL DJUR - {{this.area}}</h6>
                
                <mdb-bar-chart v-if="area == 'Småris'"
                    :data="numAnimalBarChartDataSmaris"
                    :options="numAnimalBarChartOptionsSmaris"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
                <mdb-bar-chart v-else-if="area == 'Glotterbäck'"
                    :data="numAnimalBarChartDataGlotterback"
                    :options="numAnimalBarChartOptionsGlotterback"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
                <mdb-bar-chart v-else-if="area == 'Haddebo'"
                    :data="numAnimalBarChartDataHaddebo"
                    :options="numAnimalBarChartOptionsHaddebo"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
                <mdb-bar-chart v-else-if="area == 'Västerby'"
                    :data="numAnimalBarChartDataVasterby"
                    :options="numAnimalBarChartOptionsVasterby"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
                <mdb-bar-chart v-else-if="area == 'Nästorp'"
                    :data="numAnimalBarChartDataNastorp"
                    :options="numAnimalBarChartOptionsNastorp"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
                <mdb-bar-chart v-else-if="area == 'Pålsboda'"
                    :data="numAnimalBarChartDataPalsboda"
                    :options="numAnimalBarChartOptionsPalsboda"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
            </div>
            <div class="mt-2 justify-content-center">
                <table class="ml-3 table-striped" style="width: 95%;">
                    <thead>
                        <tr>
                            <th>Djurslag - {{this.area}}</th>
                            <th>Antal</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="info-table" width="75%">Kronvilt</td>
                            <td class="info-table">{{ this.animalCount(this.area)[0] }} st</td>
                        </tr>
                        <tr>
                            <td class="info-table">Dovvilt</td>
                            <td class="info-table">{{ this.animalCount(this.area)[1] }} st</td>
                        </tr>
                        <tr>
                            <td class="info-table">Älg</td>
                            <td class="info-table">{{ this.animalCount(this.area)[2] }} st</td>
                        </tr>
                        <tr>
                            <td class="info-table">Vildsvin</td>
                            <td class="info-table">{{ this.animalCount(this.area)[3] }} st</td>
                        </tr>
                        <tr>
                            <td class="info-table">Rådjur</td>
                            <td class="info-table">{{ this.animalCount(this.area)[4] }} st</td>
                        </tr>
                        <tr>
                            <td class="info-table">Totalt</td>
                            <td class="info-table">{{ this.animalCount(this.area).reduce( (a, b) => a + b) }} st</td>
                        </tr>

                    </tbody>
                </table>
            </div>
                
            
            <hr>
            <div class="mt-4 justify-content-center">
                <h6>SORTS JAKT - {{ this.area}}</h6>
                <mdb-pie-chart v-if="area == 'Småris'"
                    datalabels
                    :data="kindOfHuntPieChartDataSmaris"
                    :options="kindOfHuntPieChartOptionsSmaris"
                    :width="100"
                    :height="250"
                    />
                <mdb-pie-chart v-else-if="area == 'Glotterbäck'"
                    datalabels
                    :data="kindOfHuntPieChartDataGlotterback"
                    :options="kindOfHuntPieChartOptionsGlotterback"
                    :width="100"
                    :height="250"
                    />
                <mdb-pie-chart v-else-if="area == 'Haddebo'"
                    datalabels
                    :data="kindOfHuntPieChartDataHaddebo"
                    :options="kindOfHuntPieChartOptionsHaddebo"
                    :width="100"
                    :height="250"
                    />
                <mdb-pie-chart v-else-if="area == 'Västerby'"
                    datalabels
                    :data="kindOfHuntPieChartDataVasterby"
                    :options="kindOfHuntPieChartOptionsVasterby"
                    :width="100"
                    :height="250"
                    />
                <mdb-pie-chart v-else-if="area == 'Nästorp'"
                    datalabels
                    :data="kindOfHuntPieChartDataNastorp"
                    :options="kindOfHuntPieChartOptionsNastorp"
                    :width="100"
                    :height="250"
                    />
                <mdb-pie-chart v-else-if="area == 'Pålsboda'"
                    datalabels
                    :data="kindOfHuntPieChartDataPalsboda"
                    :options="kindOfHuntPieChartOptionsPalsboda"
                    :width="100"
                    :height="250"
                    />
                <div>
                    <table class="mt-2 ml-3 table-striped" style="width: 95%;">
                        <thead>
                            <tr>
                                <th>Sorts jakt - {{ this.area }}</th>
                                <th>Antal/Procent</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="info-table">
                                <td class="info-table" width="75%">Gemensam jakt</td>
                                <td class="info-table">{{ this.kindOfGemensamByArea(this.area) }} st / {{ Math.round((this.kindOfGemensamByArea(this.area)/(this.kindOfGemensamByArea(this.area)+this.kindOfEnsamByArea(this.area))) * 100) }} %</td>
                            </tr>
                            <tr>
                                <td class="info-table">Ensamjakt</td>
                                <td class="info-table">{{ this.kindOfEnsamByArea(this.area) }} st / {{ Math.round((this.kindOfEnsamByArea(this.area)/(this.kindOfGemensamByArea(this.area)+this.kindOfEnsamByArea(this.area))) * 100) }} %</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
            </div>

            <hr>

            <div class="mt-4 justify-content-center">
                <h6>SKJUTNA DJUR PER JÄGARE - {{ this.area }}</h6>
                <mdb-horizontal-bar-chart v-if="area == 'Småris'"
                    :data="animalsShotHorizontalBarChartDataSmaris"
                    :options="animalsShotHorizontalBarChartOptionsSmaris"
                    :width="600"
                    :height="300"
                ></mdb-horizontal-bar-chart>
                <mdb-horizontal-bar-chart v-else-if="area == 'Glotterbäck'"
                    :data="animalsShotHorizontalBarChartDataGlotterback"
                    :options="animalsShotHorizontalBarChartOptionsGlotterback"
                    :width="600"
                    :height="300"
                ></mdb-horizontal-bar-chart>
                <mdb-horizontal-bar-chart v-else-if="area == 'Haddebo'"
                    :data="animalsShotHorizontalBarChartDataHaddebo"
                    :options="animalsShotHorizontalBarChartOptionsHaddebo"
                    :width="600"
                    :height="300"
                ></mdb-horizontal-bar-chart>
                <mdb-horizontal-bar-chart v-else-if="area == 'Västerby'"
                    :data="animalsShotHorizontalBarChartDataVasterby"
                    :options="animalsShotHorizontalBarChartOptionsVasterby"
                    :width="600"
                    :height="300"
                ></mdb-horizontal-bar-chart>
                <mdb-horizontal-bar-chart v-else-if="area == 'Nästorp'"
                    :data="animalsShotHorizontalBarChartDataNastorp"
                    :options="animalsShotHorizontalBarChartOptionsNastorp"
                    :width="600"
                    :height="300"
                ></mdb-horizontal-bar-chart>
                <mdb-horizontal-bar-chart v-else-if="area == 'Pålsboda'"
                    :data="animalsShotHorizontalBarChartDataPalsboda"
                    :options="animalsShotHorizontalBarChartOptionsPalsboda"
                    :width="600"
                    :height="300"
                ></mdb-horizontal-bar-chart>
            </div>
        </div>
    
        <div v-if="activeA">
            <div class=" mt-3 d-flex justify-content-center">
                <h6>FÖRDELNING</h6>
            </div>
            <div class=" mt-3 d-flex justify-content-center">
                <mdb-radar-chart
                :data="radarChartDataSmaris"
                :options="radarChartOptionsSmaris"
                :width="400"
                :height="400"
                ></mdb-radar-chart>
            </div>
        </div>
    </mdb-container>
</template>
<script>
  import { mdbBtn, mdbBtnGroup, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbContainer, mdbBarChart, mdbPieChart, mdbHorizontalBarChart, mdbRadarChart } from 'mdbvue';
  export default {
    name: 'killreport',
    components: {
      mdbBtn,
      mdbBtnGroup,
      mdbBtnToolbar,
      mdbModal,
      mdbModalHeader,
      mdbModalTitle,
      mdbModalBody,
      mdbModalFooter,
      mdbContainer,
      mdbBarChart,
      mdbPieChart,
      mdbHorizontalBarChart,
      mdbRadarChart
    },
    props: [
            'hunters',
            'anonhunter',
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
            'killreportBaseUrl',
            'userProfileUrl',
            'animalMoose',
            'animalReddeer',
            'animalFallowdeer',
            'animalBoar',
            'animalRoedeer',
            'kindEnsamjakt',
            'kindGemensamJakt',
            'animalsShot',
            'reddeerDist',
            'fallowdeerDist',
            'mooseDist',
            'boarDist',
            'roedeerDist'
        ],
    data() {
        return {
            showAverageMeat:true,
            meetModal: false,
            speciesSelected: null,
            activeD: true,
            activeC: false,
            activeA: false,
            area: 'Småris',
            areas: [],
            dist_categories: [
                'Vuxet handjur', 
                'Vuxet hondjur', 
                'Kalv/killing handjur', 
                'Kalv/killing hondjur',
                'Kalv obestämd'
            ],

            

            // pga bug hos mdb kan man inte dynamiskt uppdatera charts
            // gör därför en chart per område.

            // FÖRDELNING - SMÅRIS
            radarChartDataSmaris: {
                labels: [
                'Vuxet handjur', 
                'Vuxet hondjur', 
                'Kalv handjur', 
                'Kalv hondjur',
                'Kalv obestämd'
            ],
                datasets: [
                        {
                            label: "",
                            backgroundColor: "rgba(50, 50, 50, 0.3)",
                            borderColor: "rgba(255, 99, 132, 1)",
                            borderWidth: 0.7,
                            data: []
                        },
                        {
                            label: "",
                            backgroundColor: "rgba(80, 30, 100, 0.3)",
                            borderColor: "rgba(100, 99, 132, 1)",
                            borderWidth: 0.7,
                            data: []
                        },
                        {
                            label: "",
                            backgroundColor: "rgba(80, 200, 100, 0.3)",
                            borderColor: "rgba(100, 200, 132, 1)",
                            borderWidth: 0.7,
                            data: []
                        },
                        {
                            label: "",
                            backgroundColor: "rgba(250, 100, 100, 0.3)",
                            borderColor: "rgba(250, 150, 150, 1)",
                            borderWidth: 0.7,
                            data: []
                        },
                        {
                            label: "",
                            backgroundColor: "rgba(250, 200, 200, 0.3)",
                            borderColor: "rgba(250, 200, 150, 1)",
                            borderWidth: 0.7,
                            data: []
                        }
                    ]
                },
                radarChartOptionsSmaris: {
                    responsive: true,
                    maintainAspectRatio: false
                },

            // SMÅRIS
            numAnimalBarChartDataSmaris: {
                labels: [
                    "Kronvilt",
                    "Dovvilt",
                    "Älg",
                    "Vildsvin",
                    "Rådjur"
                ],
                datasets: [
                    {
                        label: "Antal skjutna djur",
                        data: this.animalCount("Småris"),
                        backgroundColor: [
                            "#5b5b5b",
                            "#5b5b5b)",
                            "#5b5b5b",
                            "#5b5b5b",
                            "#5b5b5b"
                        ],
                        borderColor: [
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptionsSmaris: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },


            // GLOTTERBÄCK
            numAnimalBarChartDataGlotterback: {
                labels: [
                    "Kronvilt",
                    "Dovvilt",
                    "Älg",
                    "Vildsvin",
                    "Rådjur"
                ],
                datasets: [
                    {
                        label: "Antal skjutna djur",
                        data: this.animalCount("Glotterbäck"),
                        backgroundColor: [
                            "#5b5b5b",
                            "#5b5b5b)",
                            "#5b5b5b",
                            "#5b5b5b",
                            "#5b5b5b"
                        ],
                        borderColor: [
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptionsGlotterback: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },


            // HADDEBO
            numAnimalBarChartDataHaddebo: {
                labels: [
                    "Kronvilt",
                    "Dovvilt",
                    "Älg",
                    "Vildsvin",
                    "Rådjur"
                ],
                datasets: [
                    {
                        label: "Antal skjutna djur",
                        data: this.animalCount("Haddebo"),
                        backgroundColor: [
                            "#5b5b5b",
                            "#5b5b5b)",
                            "#5b5b5b",
                            "#5b5b5b",
                            "#5b5b5b"
                        ],
                        borderColor: [
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptionsHaddebo: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },


            // VÄSTERBY
            numAnimalBarChartDataVasterby: {
                labels: [
                    "Kronvilt",
                    "Dovvilt",
                    "Älg",
                    "Vildsvin",
                    "Rådjur"
                ],
                datasets: [
                    {
                        label: "Antal skjutna djur",
                        data: this.animalCount("Västerby"),
                        backgroundColor: [
                            "#5b5b5b",
                            "#5b5b5b)",
                            "#5b5b5b",
                            "#5b5b5b",
                            "#5b5b5b"
                        ],
                        borderColor: [
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptionsVasterby: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },



            // NÄSTORP
            numAnimalBarChartDataNastorp: {
                labels: [
                    "Kronvilt",
                    "Dovvilt",
                    "Älg",
                    "Vildsvin",
                    "Rådjur"
                ],
                datasets: [
                    {
                        label: "Antal skjutna djur",
                        data: this.animalCount("Nästorp"),
                        backgroundColor: [
                            "#5b5b5b",
                            "#5b5b5b)",
                            "#5b5b5b",
                            "#5b5b5b",
                            "#5b5b5b"
                        ],
                        borderColor: [
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptionsNastorp: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },




            // PÅLSBODA
            numAnimalBarChartDataPalsboda: {
                labels: [
                    "Kronvilt",
                    "Dovvilt",
                    "Älg",
                    "Vildsvin",
                    "Rådjur"
                ],
                datasets: [
                    {
                        label: "Antal skjutna djur",
                        data: this.animalCount("Pålsboda"),
                        backgroundColor: [
                            "#5b5b5b",
                            "#5b5b5b)",
                            "#5b5b5b",
                            "#5b5b5b",
                            "#5b5b5b"
                        ],
                        borderColor: [
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d",
                            "#2d2d2d)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptionsPalsboda: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                        display: true,
                        color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },






            // SORTS JAKT - SMÅRIS
            kindOfHuntPieChartDataSmaris: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindOfGemensamByArea('Småris'), this.kindOfEnsamByArea('Småris')],
                    backgroundColor: [
                        "#c2a875",
                        "#5b5b5b",
                    ],
                    hoverBackgroundColor: [
                        "#d9c39a",
                        "#717171"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptionsSmaris: {
                responsive: true,
                maintainAspectRatio: false
            },


            // SORTS JAKT - GLOTTERBÄCK
            kindOfHuntPieChartDataGlotterback: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindOfGemensamByArea('Glotterbäck'), this.kindOfEnsamByArea('Glotterbäck')],
                    backgroundColor: [
                        "#c2a875",
                        "#5b5b5b",
                    ],
                    hoverBackgroundColor: [
                        "#d9c39a",
                        "#717171"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptionsGlotterback: {
                responsive: true,
                maintainAspectRatio: false
            },

            // SORTS JAKT - HADDEBO
            kindOfHuntPieChartDataHaddebo: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindOfGemensamByArea('Haddebo'), this.kindOfEnsamByArea('Haddebo')],
                    backgroundColor: [
                        "#c2a875",
                        "#5b5b5b",
                    ],
                    hoverBackgroundColor: [
                        "#d9c39a",
                        "#717171"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptionsHaddebo: {
                responsive: true,
                maintainAspectRatio: false
            },


            // SORTS JAKT - VÄSTERBY
            kindOfHuntPieChartDataVasterby: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindOfGemensamByArea('Västerby'), this.kindOfEnsamByArea('Västerby')],
                    backgroundColor: [
                        "#c2a875",
                        "#5b5b5b",
                    ],
                    hoverBackgroundColor: [
                        "#d9c39a",
                        "#717171"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptionsVasterby: {
                responsive: true,
                maintainAspectRatio: false
            },

            // SORTS JAKT - NÄSTROP
            kindOfHuntPieChartDataNastorp: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindOfGemensamByArea('Nästorp'), this.kindOfEnsamByArea('Nästorp')],
                    backgroundColor: [
                        "#c2a875",
                        "#5b5b5b",
                    ],
                    hoverBackgroundColor: [
                        "#d9c39a",
                        "#717171"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptionsNastorp: {
                responsive: true,
                maintainAspectRatio: false
            },

            // SORTS JAKT - PÅLSBODA
            kindOfHuntPieChartDataPalsboda: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindOfGemensamByArea('Pålsboda'), this.kindOfEnsamByArea('Pålsboda')],
                    backgroundColor: [
                        "#c2a875",
                        "#5b5b5b",
                    ],
                    hoverBackgroundColor: [
                        "#d9c39a",
                        "#717171"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptionsPalsboda: {
                responsive: true,
                maintainAspectRatio: false
            },







            // DJUR PER SKYTT - SMÅRIS
            animalsShotHorizontalBarChartDataSmaris: {
                labels: this.animalShotHunternames(),
                datasets: [
                    {
                        label: "Antal skjutna djur per jägare - Småris",
                        data: this.animalShotsByArea('Småris'),
                        backgroundColor: this.animalShotBackgroundColors(),
                        borderColor: this.animalShotBorderColors(),
                        borderWidth: 1
                    }
                ]
            },
            animalsShotHorizontalBarChartOptionsSmaris: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },


            animalsShotHorizontalBarChartDataGlotterback: {
                labels: this.animalShotHunternames(),
                datasets: [
                    {
                        label: "Antal skjutna djur per jägare - Glotterbäck",
                        data: this.animalShotsByArea('Glotterbäck'),
                        backgroundColor: this.animalShotBackgroundColors(),
                        borderColor: this.animalShotBorderColors(),
                        borderWidth: 1
                    }
                ]
            },
            animalsShotHorizontalBarChartOptionsGlotterback: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },


            // HADDEBO
            animalsShotHorizontalBarChartDataHaddebo: {
                labels: this.animalShotHunternames(),
                datasets: [
                    {
                        label: "Antal skjutna djur per jägare - Haddebo",
                        data: this.animalShotsByArea('Haddebo'),
                        backgroundColor: this.animalShotBackgroundColors(),
                        borderColor: this.animalShotBorderColors(),
                        borderWidth: 1
                    }
                ]
            },
            animalsShotHorizontalBarChartOptionsHaddebo: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },



            // VÄSTERBY
            animalsShotHorizontalBarChartDataVasterby: {
                labels: this.animalShotHunternames(),
                datasets: [
                    {
                        label: "Antal skjutna djur per jägare - Västerby",
                        data: this.animalShotsByArea('Västerby'),
                        backgroundColor: this.animalShotBackgroundColors(),
                        borderColor: this.animalShotBorderColors(),
                        borderWidth: 1
                    }
                ]
            },
            animalsShotHorizontalBarChartOptionsVasterby: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },


            // NÄSTORP
            animalsShotHorizontalBarChartDataNastorp: {
                labels: this.animalShotHunternames(),
                datasets: [
                    {
                        label: "Antal skjutna djur per jägare - Nästorp",
                        data: this.animalShotsByArea('Nästorp'),
                        backgroundColor: this.animalShotBackgroundColors(),
                        borderColor: this.animalShotBorderColors(),
                        borderWidth: 1
                    }
                ]
            },
            animalsShotHorizontalBarChartOptionsNastorp: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },

            // PÅLSBODA
            animalsShotHorizontalBarChartDataPalsboda: {
                labels: this.animalShotHunternames(),
                datasets: [
                    {
                        label: "Antal skjutna djur per jägare - Pålsboda",
                        data: this.animalShotsByArea('Pålsboda'),
                        backgroundColor: this.animalShotBackgroundColors(),
                        borderColor: this.animalShotBorderColors(),
                        borderWidth: 1
                    }
                ]
            },
            animalsShotHorizontalBarChartOptionsPalsboda: {
                responsive: true,
                maintainAspectRatio: false,
                scales: {
                    xAxes: [
                    {
                        barPercentage: 1,
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ],
                    yAxes: [
                    {
                        gridLines: {
                            display: true,
                            color: "rgba(0, 0, 0, 0.1)"
                        }
                    }
                    ]
                }
            },




        }
    },
    computed: {
        
        
    },
    mounted() {
        // console.log('meatMooseAverage:');
        // console.log(this.meatMooseAverage);
        // console.log('meatReddeerAverage:');
        // console.log(this.meatReddeerAverage);
        // console.log('meatFallowdeerAverage:');
        // console.log(this.meatFallowdeerAverage);
        // console.log('meatRoedeerAverage:');
        // console.log(this.meatRoedeerAverage);
        // console.log('meatBoarAverage:');
        // console.log(this.meatBoarAverage);

        let sortedMooseAverage = this.bubble(this.meatMooseAverage);
        let sortedReddeerAverage = this.bubble(this.meatReddeerAverage);
        let sortedFallowdeerAverage = this.bubble(this.meatFallowdeerAverage);
        let sortedRoedeerAverage = this.bubble(this.meatRoedeerAverage);
        let sortedBoarAverage= this.bubble(this.meatBoarAverage);

        let sortedMooseTotal = this.bubble(this.meatMooseTotal);
        let sortedReddeerTotal = this.bubble(this.meatReddeerTotal);
        let sortedFallowdeerTotal = this.bubble(this.meatFallowdeerTotal);
        let sortedRoedeerTotal = this.bubble(this.meatRoedeerTotal);
        let sortedBoarTotal = this.bubble(this.meatBoarTotal);

        console.log('sortedMooseTotal: ', sortedMooseTotal);
        console.log('sortedFallowdeerTotal: ', sortedFallowdeerTotal);

        console.log('animalMoose: ', this.animalMoose);
        console.log('animalReddeer: ', this.animalReddeer);
        console.log('animalFallowdeer: ', this.animalFallowdeer);
        console.log('animalBoar: ', this.animalBoar);
        console.log('animalRoedeer: ', this.animalRoedeer);

        console.log('this.animalMoose.length: ', this.animalMoose.length);

        console.log('this.kindEnsamjakt: ', this.kindEnsamjakt);
        console.log('this.kindGemensamJakt: ', this.kindGemensamJakt);

        console.log('this.animalsShot: ', this.animalsShot);


        console.log("this.reddeerDist: ", this.reddeerDist);
        console.log("this.fallowdeerDist: ", this.fallowdeerDist);
        console.log("this.mooseDist: ", this.mooseDist);
        console.log("this.boarDist: ", this.boarDist);
        console.log("this.roedeerDist: ", this.roedeerDist);


        this.prepDist(this.reddeerDist, 'Kronvilt');
        this.prepDist(this.fallowdeerDist, 'Dovvilt');
        this.prepDist(this.boarDist, 'Vildsvin');
        this.prepDist(this.mooseDist, 'Älg');
        this.prepDist(this.roedeerDist, 'Rådjur');

        // Bygg upp this.areas beroende på vilka områden som har djur att visa data för.
        this.setAreas();

    },
    
    methods: {
        prepDist(dist, species) {

            // KRONVILT DISTRIBUTION
            for (const [key, value] of Object.entries(dist)) {
                // key = område
                // value = object {adult_male: 4, calf_female: 2} ...
                if( key === 'Småris') {
                    let vuxethandjur = 0, vuxethondjur = 0, kalvhandjur = 0, kalvhondjur = 0, kalvunknown = 0;

                    for (const [classification, quantity] of Object.entries(value)) {
                        if(classification == 'adult_male') {
                            vuxethandjur = vuxethandjur + quantity;
                        } else if( classification == 'adult_female' || classification === 'adult_unknown') {
                            vuxethondjur = vuxethondjur + quantity
                        } else if( classification === 'calf_male')  {
                            kalvhandjur = kalvhandjur + quantity;
                        } else if( classification === 'calf_female') {
                            kalvhondjur = kalvhondjur + quantity
                        } else if( classification === 'calf_unknown') {
                            kalvunknown = kalvunknown + quantity
                        }
                    }
                    let index;
                    if(species === 'Kronvilt') {
                        index = 0;
                    } else if(species === 'Dovvilt') {
                        index = 1;
                    } else if(species === 'Vildsvin') {
                        index = 2;
                    } else if(species === 'Älg') {
                         index = 3;
                    } else if(species === 'Rådjur') {
                         index = 4;
                    }
                    // console.log("vuxethandjur: ", vuxethandjur);
                    // console.log("vuxethondjur: ", vuxethondjur);
                    // console.log("kalvhandjur: ", kalvhandjur);
                    // console.log("kalvhondjur: ", kalvhondjur);
                    // console.log("kalvunknown: ", kalvunknown);

                    this.radarChartDataSmaris.datasets[index].label = species + " - Småris";
                    this.radarChartDataSmaris.datasets[index].data = [vuxethandjur, vuxethondjur, kalvhandjur, kalvhondjur, kalvunknown];

                    // console.log(this.radarChartDataSmaris.datasets[0]);
                }
                
            
            }
            
        },
        setAreas() {
            // Skapar listan med de områden som har några djur att visa data för som kommer bygga upp 
            // områdes selecten.
            let listed_areas = ['Småris', 'Glotterbäck', 'Haddebo', 'Västerby', 'Nästorp', 'Pålsboda']; 

            listed_areas.forEach( (area, i) => {
                 if((this.animalCount(area).reduce( (a, b) => a + b)) != 0) {
                    this.areas.push({
                        'name': area,
                        'index': i
                    });
                }
            });
        },
        animalCount(area) {
            
            let reddeer, fallowdeer, moose, boar, roedeer;
            
            reddeer = this.animalReddeer.filter( obj => {
                return obj.area == area;
            });

            fallowdeer = this.animalFallowdeer.filter( obj => {
                return obj.area == area;
            });

            moose = this.animalMoose.filter( obj => {
                return obj.area == area;
            });

            boar = this.animalBoar.filter( obj => {
                return obj.area == area;
            });

            roedeer = this.animalRoedeer.filter( obj => {
                return obj.area == area;
            });

            console.log("reddeer: ", reddeer);
            
            return [reddeer.length, fallowdeer.length, moose.length, boar.length, roedeer.length];
        },
        kindOfGemensamByArea(area) {
            let res = this.kindGemensamJakt.filter( obj => {
                return obj.area == area;
            });
            return res.length;
        },
        kindOfEnsamByArea(area) {
            let res = this.kindEnsamjakt.filter( obj => {
                return obj.area == area;
            });
            return res.length;
        },
        animalShotsByArea(area) {
            let kills = [];
            this.animalsShot.forEach( obj => {
                let res;
                res = obj.killreports.filter( rep => {
                    return rep.area == area;
                });
                kills.push(res.length);
            });
            return kills;
        },
        animalShotHunternames() {
            let res = this.animalsShot.map( obj => {
                return obj.name;
            });

            return res;
        },
        animalShotNumAnimals() {
            let res = this.animalsShot.filter( obj => {
                return obj.area == 'Småris';
            });

            
            return res;
        },
        animalShotBackgroundColors() {
            let res = Array(this.animalsShot.length).fill('#5b5b5b');

            return res;
        },
        animalShotBorderColors() {
            let res = Array(this.animalsShot.length).fill('#2d2d2d');

            return res;
        },
        bubble(obj_unsorted) {
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
        selectSpecies($species) {
            this.speciesSelected = $species;
            this.meetModal = true;
        },
        backToUserProfile() {
            window.location = this.userProfileUrl;
        },
        backToKillreport_index() {
            window.location = this.killreportBaseUrl;
        },
        backToKillreport_create() {
            window.location = this.killreportBaseUrl+"/create";
        },
        closeModal() {
            this.meetModal = false;
            this.showAverageMeat = true;
        },
        totalMeat(total) {
            let res = total.reduce( (sum, obj) => {
                return sum + obj.kg;
            }, 0);

            return res; 
        },
        averageMeat(average) {
            let sum = 0;
            let count = 0;
            let res = 0;
            average.map(obj => {
                if( obj.kg > 0 ) {
                    sum = sum + obj.kg;
                    count = count + 1;
                }
            });
            if( count != 0) {
                res = Math.round((sum/count) * 10) / 10
            }

            return res;

        },
        toggleToD() {
            this.activeD = true;
            this.activeC = false;
            this.activeA = false;
        },
        toggleToC() {
            this.activeD = false;
            this.activeC = true;
            this.activeA = false;
        },
        toggleToA() {
            this.activeD = false;
            this.activeC = false;
            this.activeA = true;
        }
    }
  }
</script>
<style scope>
 .species-btn {
     width: 300px;
 }
 .meatable {
     width: 100%;
 }
 .table-sumrow {
     border-top: 1px dashed grey; 
 }
 .info-table {
    font-size: 12px;
    color: rgb(89, 89, 89);
 }
 table th {
    font-size: 0.8rem;
    font-weight: 400;
    background-color: #DCCC9B;
}
</style>