<template>
    <mdb-container>

        <!-- </mdb-btn-toolbar> -->
        <div class="d-flex flex-row justify-content-around" style="background-color: rgb(236 236 236);">
            <mdb-btn-group size="sm">
                <mdb-btn color="mdb-color" @click.native="backToUserProfile" size="sm">Min sida</mdb-btn>
                <mdb-btn color="mdb-color" @click.native="backToKillreport_create" size="sm">Rapportera</mdb-btn>
                <mdb-btn color="mdb-color" @click.native="backToKillreport_index" size="sm">Arkivet</mdb-btn>
            </mdb-btn-group>
        </div>
        
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
        <div class="mt-4 d-flex justify-content-center">
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
    
    </mdb-container>
</template>
<script>
  import { mdbBtn, mdbBtnGroup, mdbBtnToolbar, mdbModal, mdbModalHeader, mdbModalTitle, mdbModalBody, mdbModalFooter, mdbContainer } from 'mdbvue';
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
      mdbContainer
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
            'userProfileUrl'
        ],
    data() {
        return {
            showAverageMeat:true,
            meetModal:false,
            speciesSelected: null

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
</style>