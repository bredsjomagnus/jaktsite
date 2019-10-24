<template>
    <div class="container mt-5">
        <div class="row justify-content-center">
            <mdb-btn color="primary">Button</mdb-btn>
        </div>
    </div>
</template>

<script>
    import { mdbBtn } from 'mdbvue';

    export default {
        components: {
            mdbBtn
        },
        mounted() {
            console.log('Component mounted.')
        }
    }
</script>
