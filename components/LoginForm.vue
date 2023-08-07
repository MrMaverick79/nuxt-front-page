<template>
  <div>
    <form id="login-form" @submit.prevent="logIn">
      <input type="text" id="uname" name="uname" placeholder="Please enter your username"  v-model="credentials.uname"/>
      <input type="password" id="pword" name="pword" placeholder="Please enter your password" v-model="credentials.pword"/>
      <button type="submit" value="submit" >Submit</button>
    </form>
  </div>
</template>

<script>
import axios from 'axios'
export default {
  name: 'LoginForm',
  props: {
    isLoggedIn: {
      type: Boolean,
      default: false
    }
  },
  data () {
    return {
      credentials: {
        uname: '',
        pword: ''
      }
    }
  },
  methods: {
    async logIn () {
      try {
        const response = await axios.post('http://docker.drupal.localhost:8000/oauth/debug', {
          grant_type: 'password',
          client_id: 'gq3OT9eOCGSCyiPRcsPc90XPFIDCeAsEQ5CW_xSGQRE',
          client_secret: 'ChamberFishToken9!',
          username: this.credentials.uname,
          password: this.credentials.pword,
          scope: 'oauth_connect'
        })
        const token = response.data.access_token
        const loggedInStatus = true
        this.$emit('update-logged-in-status', loggedInStatus)
        console.log('Token' + token)
      } catch (err) {
        console.log(err)
      }
    }
  }
}
</script>
