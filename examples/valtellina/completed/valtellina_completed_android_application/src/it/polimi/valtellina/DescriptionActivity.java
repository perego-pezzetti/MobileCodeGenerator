package it.polimi.valtellina;

import java.io.*;

import android.os.*;
import android.app.*;
import android.content.*;
import android.graphics.Bitmap;
import android.view.*;
import android.view.View.*;
import android.widget.*;
import android.widget.AdapterView.*;
import android.webkit.*;
import android.location.*;
import android.net.Uri;
import android.provider.MediaStore;
import android.media.*;

public class DescriptionActivity extends MenuActivity {
	private Button videoButton;
	private WebView descriptionWebView;

	private ImageView logoImageView;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_description);

		videoButton = (Button) this.findViewById(R.id.videoButton);
		videoButton.setOnClickListener(new View.OnClickListener() {
			public void onClick(View v) {
				Intent intent = new Intent(DescriptionActivity.this,
						VideoActivity.class);
				//use putExtra method of Intent here for passing additional information to VideoActivity
				startActivity(intent);
			}
		});

		descriptionWebView = (WebView) this
				.findViewById(R.id.descriptionWebView);
		WebSettings descriptionWebViewSettings = descriptionWebView
				.getSettings();
		descriptionWebViewSettings.setDefaultTextEncodingName("utf-8");
		String descriptionWebViewHTMLContent = Utils
				.fromInputStreamToString(this.getResources().openRawResource(
						R.raw.valtellina));
		descriptionWebView.loadDataWithBaseURL("file:///android_asset/",
				descriptionWebViewHTMLContent, "text/html", "utf-8", null);

		logoImageView = (ImageView) findViewById(R.id.logoImageView);
		logoImageView.setTag("http://www.elitestudio.it/news/valtellina.gif");
		new ImageDownloadingTask().execute(logoImageView); //download the bitmap and set the ImageView

	}

	@Override
	protected void onStart() {
		//TODO Auto-generated method stub
		super.onStart();
	}

	@Override
	protected void onResume() {
		//TODO Auto-generated method stub
		super.onResume();
	}

	@Override
	protected void onPause() {
		//TODO Auto-generated method stub
		super.onPause();
	}

	@Override
	protected void onStop() {
		//TODO Auto-generated method stub
		super.onStop();
	}
}
