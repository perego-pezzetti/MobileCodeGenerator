package it.polimi.multimedia;

import android.app.Activity;
import android.content.Intent;
import android.view.Menu;
import android.view.MenuItem;

public class MenuActivity extends Activity {

	@Override
	public boolean onCreateOptionsMenu(Menu menu) {
		getMenuInflater().inflate(R.menu.main, menu);
		return true;
	}

	@Override
	public boolean onOptionsItemSelected(MenuItem item) {
		switch (item.getItemId()) {
			case R.id.galleryItem :
				startActivity(new Intent(this, GalleryActivity.class));
				break;
			case R.id.videocameraItem :
				startActivity(new Intent(this, VideocameraActivity.class));
				break;
			case R.id.photocameraItem :
				startActivity(new Intent(this, PhotocameraActivity.class));
				break;
			case R.id.audioRecorderItem :
				startActivity(new Intent(this, AudioRecorderActivity.class));
				break;
		}
		return true;
	}
}
