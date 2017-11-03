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