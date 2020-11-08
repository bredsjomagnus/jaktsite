<template>
    <div>
        <p>hej</p>
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
        }
    }
  }
</script>
<style scope>
 
</style>