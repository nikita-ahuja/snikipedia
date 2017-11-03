<%= image_tag("https://images.fineartamerica.com/images-medium-large-5/colorful-chimp-art-monkey-business-by-sharon-cummings-sharon-cummings.jpg", alt: "sniki-icon", width: 50, height: 50) %>





<!-- ADAM TESTING AREA FOR UPLOADING IMAGE FOR ARTICLES. -->

<div class="row article-image-upload">
	<% photos = @article.photos %>
	<% if photos %>
		<h3>Photos: <%= photos.count %></h3>

		<% photos.each do |photo| %>
			<div class="col-md-2">
				<%= render 'photos/photo_partial', photo: photo %>
			</div>
		<% end %>
	<% else %>
		<h3>No Photos Posted Yet</h3>
	<% end %>
</div>



<div id="article-photo">
		<%= image_tag("/pablo_picasso.jpeg", alt:"pablo_picasso", width: 175) %>
	</div>
	<div id="article-photo">
    <%= image_tag("/miles_davis.jpeg", alt:"miles_davis", width: 175) %>
  	</div>
  	<div id="article-photo">
        <%= image_tag("/louis_armstrong.jpeg", alt:"louis_armstrong", width: 175) %>
  	</div>
  	<div id="article-photo">
        <%= image_tag("/elliott_smith.jpeg", alt:"elliott_smith", width: 175) %>
  	</div>
  	<div id="article-photo">
        <%= image_tag("/radiohead.jpeg", alt:"radiohead", width: 175) %>
  	</div>
  	<div id="article-photo">
        <%= image_tag("/stanley_kubrick.jpeg", alt:"stanley_kubrick", width: 175) %>
  	</div>