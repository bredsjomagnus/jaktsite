<template>
    <div>
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
                <div v-if="showAverageMeat" class="d-flex flex-column w-100">      
                    <table class="table-striped meattable">
                        <tbody>

                            <tr
                            v-for="hunter in meatMooseAverage"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else class="d-flex flex-column w-100">
                    <table class="table-striped meattable">
                        <tbody>

                            <tr
                            v-for="hunter in meatMooseTotal"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div v-if="this.speciesSelected == 'Kronvilt'">
                <div v-if="showAverageMeat" class="d-flex flex-column w-100">  
                    <table class="table-striped meattable">
                        <tbody>

                            <tr
                            v-for="hunter in meatReddeerAverage"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else class="d-flex flex-column w-100">
                    <table class="table-striped meattable">
                        <tbody>

                            <tr
                            v-for="hunter in meatReddeerTotal"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div v-if="this.speciesSelected == 'Dovvilt'">
                <div v-if="showAverageMeat" class="d-flex flex-column w-100">  
                    <table class="table-striped meattable">
                        <tbody>

                            <tr
                            v-for="hunter in meatFallowdeerAverage"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else class="d-flex flex-column w-100">
                    <table class="table-striped meattable">
                        <tbody>

                            <tr
                            v-for="hunter in meatFallowdeerTotal"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div v-if="this.speciesSelected == 'Rådjur'">
                <div v-if="showAverageMeat" class="d-flex flex-column w-100">  
                    <table class="table-striped meattable">
                        <tbody>
                            <tr
                            v-for="hunter in meatRoedeerAverage"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else class="d-flex flex-column w-100">
                    <table class="table-striped meattable">
                        <tbody>
                           <tr
                            v-for="hunter in meatRoedeerTotal"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>

            <div v-if="this.speciesSelected == 'Vildsvin'">
                <div v-if="showAverageMeat" class="d-flex flex-column w-100">  
                    <table class="table-striped meattable">
                        <tbody>
                            <tr
                            v-for="hunter in meatBoarAverage"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
                <div v-else class="d-flex flex-column w-100">
                    <table class="table-striped meattable">
                        <tbody>
                            <tr
                            v-for="hunter in meatBoarTotal"
                            :key="hunter.id"
                            >   
                                <td>{{hunter.firstname}} {{hunter.lastname}}</td>
                                <td>{{hunter.kg}} kg</td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </mdb-modal-body>
        <mdb-modal-footer>
            <mdb-btn color="blue-grey" size="sm" @click.native="meetModal = false">OK!</mdb-btn>
        </mdb-modal-footer>
    </mdb-modal>
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
            'killreportBaseUrl'
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
</style>