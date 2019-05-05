<project-child>
 <div class="eachProject">
    <img src={url} >
		<h3>{ caption }</h3>
    <a href={introduction}>Learn about This Project</a>
   </div>

<script>
  var projectsRef = rootRef.child('/myProjects');
  // console.log("this.id", this.id);

  this.remove = function () {
    console.log("this.id", this.id);
    //remember how we pushed the unique key as a property of each meme?
    var updates = {};
      updates['myProjects/' + this.myProjects.id] = null;
      // updates['private/' + this.myProjects.userID + '/' + this.myProjects.id] = null;

      projectsRef.update(updates);
  }
</script>

<style>
	:scope {
		display: block;
		text-align: center;
	}

  h3{
    font-family: sans-serif;
  }
   button{
     margin:15px;
     width:80px;
     height:40px;
     background-color: yellow;
   }

</style>


</project-child>
