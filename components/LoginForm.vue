<template>
    <div>
       <form id="login-form">
          <label for="uname"> Username:</label>
          <input type="text" id="uname" name="uname">
          <label for="pword"> Password:</label>
          <input type="text" id="pword" name="pword">
          <input type="submit" value="submit">
       </form>
    </div>

</template>

<script>
export default {
  name: 'LoginForm',
  data () {
    return {
      uname: '',
      pword: ''
    }
  }
}
</script>
