<template>
	<mdb-container>
		<mdb-row>
			<mdb-card-group deck>
				<mdb-card
                v-for="killreport in killreports"
                :key="killreport.id" 
                >
					<mdb-view hover>
						<a href="#!">
							<mdb-card-image :src="display_path(killreport)" alt="Card image cap"></mdb-card-image> -->
							<mdb-mask flex-center waves overlay="white-slight"></mdb-mask>
						</a>
					</mdb-view>
					<mdb-card-body>
						<mdb-card-title></mdb-card-title>
						<mdb-card-text></mdb-card-text>

					</mdb-card-body>
                </mdb-card>
			</mdb-card-group>
		</mdb-row>
	</mdb-container>
</template>
<script>
	import { mdbContainer, mdbRow, mdbCol, mdbCard, mdbCardImage, mdbCardHeader, mdbCardBody, mdbCardTitle, mdbCardText, mdbCardFooter, mdbCardUp, mdbCardAvatar, mdbCardGroup, mdbBtn, mdbView, mdbMask, mdbIcon } from 'mdbvue';
	export default {
		name: 'CardProPage',
		components: {
			mdbContainer,
			mdbRow,
			mdbCol,
			mdbCard,
			mdbCardImage,
			mdbCardHeader,
			mdbCardBody,
			mdbCardTitle,
			mdbCardText,
			mdbCardFooter,
			mdbCardUp,
			mdbCardAvatar,
			mdbCardGroup,
			mdbBtn,
			mdbView,
			mdbMask,
			mdbIcon
        },
        props: [
            'killreports',
        ],
        data() {
            return {

            }
        },
        mounted() {
            console.log(this.killreports);
            console.log(this.animals);

        },
		methods: {
			report(id) {
				console.log(id);
			}
		}
	}
</script>