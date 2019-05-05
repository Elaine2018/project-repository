<project1>
	<div id="header">
 	 <h1>PROJECTS  REPOSITORY</h1>
  </div>

	<div class="projectDisplay">
    <p>There are <span>{projectNum}</span> projects in the repository</p>
		<input type="text" ref="urlEl" placeholder="Enter pic url">
		<input type="text" ref="captionEl" placeholder="Enter caption">
		<input type="text" ref="introEl" placeholder="Enter introduction url">
		<button type="button" onclick={ addProject }>Add Project</button>
	</div>

	<project-child each={ myProjects }>
 	</project-child>


	<script>
	var tag = this;

	var projectsRef = rootRef.child('myProjects');

		this.myProjects = [];
		console.log(this.myProjects.length);

    this.projectNum = this.myProjects.length;

		var that  =  this;

		this.remove = function(event) {
			console.log('EVENT:', event);

			var Obj = event.item;
			var index = that.myProjects.indexOf(Obj);
			that.myProjects.splice(index, 1);
			//since in this case, event is triggered by child, parent data won't be updated until
			//we call it to update manually.
			// console.log(that.projectNum);
			// console.log("removing");
			console.log(that.myProjects.length);
			that.projectNum = that.myProjects.length;
			that.update();
		};

		this.addProject = function(event) {
			console.log(event);
			var url = this.refs.urlEl.value;
			var intro = this.refs.introEl.value;
			var caption = this.refs.captionEl.value;
			var newProject = { url: url, caption: caption,introduction:intro };
			// We are adding a book object to the source of truth array.
			// this.myProjects.push(newProject);
			projectsRef.push(newProject);

			// RESET INPUTS this.refs.urlEl.value = "";
      this.projectNum = this. myProjects.length;
			this.refs.captionEl.value = "";
			this.refs.urlEl.value = "";
			this.refs.introEl.value = "";
		};

		 // this.on("updated",function(){
		 // this.projectNum = this.myProjects.length;
			//  // that.update();
		 // });

		 projectsRef.on('value', function (snap) {
       let rawdata = snap.val();
       // console.log("rawdata", rawdata);
       let tempData = [];
       for (key in rawdata) {
         tempData.push(rawdata[key]);
       }
       // console.log("myMemes", tag.myMemes);
       tag.myProjects = tempData;
			 tag.projectNum = tag.myProjects.length;

       tag.update();
       observable.trigger('updateMemes', tempData);
     })
	</script>

	<style>
		:scope {
			display: block;
			background: #d1d1e0;
			padding: 15px;
		}
    h1 {
    	font-family: sans-serif
    }
		p{
     font-family: sans-serif;
		 margin-left: 10%;
    }

		img {
      margin-top: 10px;
			width: 50%;
		}
		#header {
			text-align:center;
		}
		.projectDisplay{
      margin-left: 33%;
    }
		span {
			display: inline-block;
			padding: 0.25em;
			background-color: white;
			border-radius: 2em;
			font-weight: bold;
		}
	</style>
</project1>
