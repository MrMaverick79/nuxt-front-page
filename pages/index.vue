<template>
  <p>
    {{ response }}
  </p>
</template>
<script>
export default {
  name: 'IndexPage',
  data () {
    return {
      response: 'Loading please wait...'
    }
  },
  mounted () {
    this.fetchData()
  },
  methods: {
    fetchData () {
      const { DruxtClient } = require('druxt')
      const druxt = new DruxtClient('http://drupal.docker.localhost:8000/')
      if (druxt) {
        console.log('We are on our way. Making changes.')
        druxt.getCollection('node--page').then((collection) => {
          console.log(collection.data[0].attributes.body.value)
          this.response = collection.data[0].attributes.body.value
        })
      }
    }
  } // end fetchData
}
</script>
