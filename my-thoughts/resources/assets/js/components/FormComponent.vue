<template>

<div class="card">
	 <div class="card-header">What are you thinking now?</div>

	 <div class="card-body">

		  <form action="" v-on:submit.prevent="newThought()">
				<div class="form-group" >
					<label for="">I am thought now in:</label>
					<input type="text" class="form-control" name="thought"
					v-model= "description">
				</div>
				<button type="submit" class="btn btn-primary">
					Send Thought
				</button>
		  </form>
	 </div>
</div>


</template>

<script>
    export default {
	 	  data(){
		  		return{
					description: ''
				}
		  },
        mounted() {
            console.log('Component mounted.')
        },
		  methods: {
		  		newThought(){
					let thought = {
						id: 2,
						description: this.description,
						created_at: '17-06-2018'
					}
					this.$emit('new', thought);
					this.description='';

				}
		  }
    }
</script>
