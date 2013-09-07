package it.polimi.multimedia;

import java.io.*;
import java.text.SimpleDateFormat;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import android.os.*;
import android.app.*;
import android.content.*;
import android.content.res.*;
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

public class PhotoGridActivity extends MenuActivity
		implements
			OnItemClickListener {
	private GridView photosGridView;
	private PhotoGridAdapter photosGridViewAdapter;
	private String[] photosGridViewContents;

	@Override
	protected void onCreate(Bundle savedInstanceState) {
		super.onCreate(savedInstanceState);
		setContentView(R.layout.activity_photogrid);
	}
	
	private String[] filesAtPath(String path){
		File directory = new File(path);
		directory.mkdir();
		ArrayList<String> filesNames = new ArrayList<String>();
		for(File file : directory.listFiles())
			filesNames.add(file.getName());
		String[] filesNamesArray = new String[filesNames.size()];
		return filesNames.toArray(filesNamesArray);
	}

	@Override
	public void onItemClick(AdapterView<?> l, View v, int position, long id) {
		if (l.getId() == R.id.photosGridView) {
			String clickedItem = photosGridViewContents[position];
			Intent intent = new Intent(PhotoGridActivity.this,
					PhotoViewerActivity.class);
			intent.putExtra("filename", clickedItem); //use putExtra method of Intent here for passing additional information to PhotoViewerActivity
			startActivity(intent);
		}
	}

	@Override
	protected void onStart() {
		//TODO Auto-generated method stub
		super.onStart();
	}

	@Override
	protected void onResume() {
		super.onResume();
		photosGridViewContents = this.filesAtPath(getFilesDir().getAbsolutePath() + "/images");//new String[]{};
		photosGridViewAdapter = new PhotoGridAdapter(this, R.layout.item_imagesgrid, photosGridViewContents);
		photosGridView = (GridView) findViewById(R.id.photosGridView);
		photosGridView.setAdapter(photosGridViewAdapter);
		photosGridView.setOnItemClickListener(this);
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
	
	private class PhotoGridAdapter extends ArrayAdapter<String> {
		private Context context;
	    private int layoutResourceId;
	    
	    public PhotoGridAdapter(Context context, int layoutResourceId, String[] data) {
	        super(context, layoutResourceId, data);
	    	this.layoutResourceId = layoutResourceId;
	        this.context = context;
	    }
	    @Override
	    public View getView(int position, View convertView, ViewGroup parent) {
	    	View row = convertView;
	    	PhotoGridHolder holder = null;

	        if(row == null){
	            LayoutInflater inflater = ((Activity)context).getLayoutInflater();
	            row = inflater.inflate(layoutResourceId, parent, false);
	            holder = new PhotoGridHolder();
	            holder.itemImageView = (ImageView) row.findViewById(R.id.galleryGridImage);
	            row.setTag(holder);
	        }else{
	            holder = (PhotoGridHolder) row.getTag();
	        }
	        String filename = getItem(position);
	        String path = context.getFilesDir().getAbsolutePath() + "/images/" + filename;
	        
	        holder.itemImageView.setImageURI(Uri.parse(path));
	        return row;
	    }
	    private class PhotoGridHolder {
	    	ImageView itemImageView;
	    }
	}
}
