package it.polimi.valtellina;

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
			case R.id.descriptionItem :
				startActivity(new Intent(this, DescriptionActivity.class));
				break;
			case R.id.turismLocationItem :
				startActivity(new Intent(this,
						TurismLocationsListActivity.class));
				break;
		}
		return true;
	}
}
