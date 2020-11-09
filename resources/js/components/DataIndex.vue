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
                    <mdb-btn color="mdb-color" @click.native="toggleToD" :active="activeD" size="sm">Djur</mdb-btn>
                    <mdb-btn color="mdb-color" @click.native="toggleToC" :active="activeC" size="sm">Diagram</mdb-btn>

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
            <div class="mt-2">
                <h6>ANTAL DJUR</h6>
                <mdb-bar-chart
                    :data="numAnimalBarChartData"
                    :options="numAnimalBarChartOptions"
                    :width="600"
                    :height="300"
                ></mdb-bar-chart>
                <div>
                    <table class="w-100 ml-3 table-striped">
                        <thead>
                            <tr>
                                <th>Djur</th>
                                <th>Antal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td class="info-table" width="60%">Kronvilt</td>
                                <td class="info-table">{{ this.animalReddeer.length }} st</td>
                            </tr>
                            <tr>
                                <td class="info-table">Dovvilt</td>
                                <td class="info-table">{{ this.animalFallowdeer.length }} st</td>
                            </tr>
                            <tr>
                                <td class="info-table">Älg</td>
                                <td class="info-table">{{ this.animalMoose.length }} st</td>
                            </tr>
                            <tr>
                                <td class="info-table">Vildsvin</td>
                                <td class="info-table">{{ this.animalBoar.length }} st</td>
                            </tr>
                            <tr>
                                <td class="info-table">Rådjur</td>
                                <td class="info-table">{{ this.animalRoedeer.length }} st</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
            </div>
            <hr>
            <div class="mt-4 justify-content-center">
                <h6>SORTS JAKT</h6>
                <mdb-pie-chart
                    datalabels
                    :data="kindOfHuntPieChartData"
                    :options="kindOfHuntPieChartOptions"
                    :width="600"
                    :height="300"
                    />
                <div>
                    <table class="w-100 ml-3 table-striped">
                        <thead>
                            <tr>
                                <th>Sort</th>
                                <th>Antal</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr class="info-table">
                                <td class="info-table" width="60%">Gemensam jakt</td>
                                <td class="info-table">{{ this.kindGemensamJakt.length }} st</td>
                            </tr>
                            <tr>
                                <td class="info-table">Ensamjakt</td>
                                <td class="info-table">{{ this.kindEnsamjakt.length }} st</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                
            </div>
        </div>
    
    </mdb-container>
</template>
<script>
  import { mdbBtn, mdbBtnGroup, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbContainer, mdbBarChart, mdbPieChart } from 'mdbvue';
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
      mdbPieChart
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
            'kindGemensamJakt'
        ],
    data() {
        return {
            showAverageMeat:true,
            meetModal: false,
            speciesSelected: null,
            activeD: true,
            activeC: false,
            numAnimalBarChartData: {
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
                        data: [
                            this.animalReddeer.length,
                            this.animalFallowdeer.length,
                            this.animalMoose.length,
                            this.animalBoar.length,
                            this.animalRoedeer.length,
                            ],
                        backgroundColor: [
                            "rgba(255, 99, 132, 0.7)",
                            "rgba(54, 162, 235, 0.7)",
                            "rgba(255, 206, 86, 0.7)",
                            "rgba(75, 192, 192, 0.7)",
                            "rgba(153, 102, 255, 0.7)"
                        ],
                        borderColor: [
                            "rgba(255,99,132,1)",
                            "rgba(54, 162, 235, 1)",
                            "rgba(255, 206, 86, 1)",
                            "rgba(75, 192, 192, 1)",
                            "rgba(153, 102, 255, 1)"
                        ],
                        borderWidth: 1
                    }
                ]
            },
            numAnimalBarChartOptions: {
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

            kindOfHuntPieChartData: {
                labels: [ "Gemensam jakt", "Ensamjakt"],
                datasets: [
                    {
                    data: [this.kindGemensamJakt.length, this.kindEnsamjakt.length],
                    backgroundColor: [
                        "rgba(100, 100, 10, 0.5)",
                        "rgba(50, 50, 50, 0.7)",
                    ],
                    hoverBackgroundColor: [
                        "#FF5A5E",
                        "#FF5A5E"
                    ]
                    }
                ]
            },
            kindOfHuntPieChartOptions: {
                responsive: true,
                maintainAspectRatio: false
            }

        }
    },
    computed: {
        numAnimalArray() {
            
        }
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
    },
    methods: {
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
        },
        toggleToC() {
            this.activeC = true;
            this.activeD = false;
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
    font-style: italic;
 }
</style>