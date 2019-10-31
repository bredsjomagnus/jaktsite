<template>
  
    <!-- <mdb-btn-group>
      <mdb-btn color="mdb-color" class="mb-0">Button</mdb-btn>
      <mdb-btn color="mdb-color" class="mb-0">Button</mdb-btn>
      <mdb-btn color="mdb-color" class="mb-0">Button</mdb-btn>
      <mdb-btn color="mdb-color" class="mb-0">Button</mdb-btn>
      <mdb-btn color="mdb-color" class="mb-0">Button</mdb-btn>
    </mdb-btn-group> -->

 
        <mdb-card>
            <mdb-card-body 
            v-if="step === 'species'"
            >
            <mdb-card-title>VÄLJ DJUR</mdb-card-title>
            <mdb-card-text>Beronde på vilket djur väljs sedan djurklassificering</mdb-card-text>
            <!-- <mdb-btn-group> -->
                <div class="d-flex flex-column">
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('älg')" class='w-100'>Älg</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('kronvilt')" class='w-100'>Kronvilt</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('dovvilt')" class='w-100'>Dovvilt</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('rådjur')" class='w-100'>Rådjur</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('vildsvin')" class='w-100'>Vildsvin</mdb-btn></div>
                </div>
            <!-- </mdb-btn-group> -->
          </mdb-card-body>
        
            <mdb-card-body 
            v-else-if="step === 'speciestype'"
            >
            <mdb-card-title>VÄLJ DJURKLASSIFICERING</mdb-card-title>
            <mdb-card-text>Beroende på vilken klassificering följer ytterligare val.</mdb-card-text>
            <!-- <mdb-btn-group> -->
                <div class="d-flex flex-column"
                v-if="fields.species == 'älg'"
                >
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('älg')" class='w-100'>Tjur</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('kronvilt')" class='w-100'>Obestämt vuxet hondjur</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('dovvilt')" class='w-100'>Ko</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('rådjur')" class='w-100'>Kviga</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('vildsvin')" class='w-100'>Kvigkalv</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('vildsvin')" class='w-100'>Obestämd kalv</mdb-btn></div>
                </div>
                <div class="d-flex flex-column"
                v-else-if="fields.species == 'kronvilt'"
                >
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('älg')" class='w-100'>Hjort</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('kronvilt')" class='w-100'>Obestämt vuxet hondjur</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('dovvilt')" class='w-100'>Hind</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('rådjur')" class='w-100'>Smalhind</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('vildsvin')" class='w-100'>Hjortkalv</mdb-btn></div>
                    <div class="p-2"><mdb-btn color="primary" @click="setSpecies('vildsvin')" class='w-100'>Hindkalv</mdb-btn></div>
                </div>
                <mdb-btn color="primary" @click="stepBack('species')">Föregående</mdb-btn>
          </mdb-card-body>
          
        </mdb-card>
</template>
<script>
  import { mdbBtn, mdbBtnGroup, mdbDropdown, mdbDropdownItem, mdbDropdownMenu, mdbDropdownToggle, mdbCard, mdbCardBody, mdbCardTitle, mdbCardText, mdbRow, mdbCol } from 'mdbvue';
  export default {
    name: 'ButtonsGroup',
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
      mdbCardText
    },
    props: [
			'authUser'
        ],
    data() {
        return {
            csrf: document.querySelector('meta[name="csrf-token"]').getAttribute('content'),
            fields: {
                shooter_id: null,
                reporter_id: null,
                kindofhunt: null,
                animal_id: null,
                killdate: null,
                season: null,
                area_id: null,
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
            step: 'species'
        }
    },
    methods: {
        setSpecies(value) {
            this.fields.species = value;
            this.step = 'speciestype';
        },
        stepBack(steptotake) {
            this.step = steptotake;
        }
    }
  }
</script>