package cn.lllllan.android.myapplication;

import android.content.Context;
import android.view.LayoutInflater;
import android.view.View;
import android.view.ViewGroup;
import android.widget.ArrayAdapter;
import android.widget.ImageView;
import android.widget.TextView;

import java.util.List;

@SuppressWarnings({"all"})

public class FruitAdapter extends ArrayAdapter<Fruit> {

    private int resourceId;

    public FruitAdapter(Context context, int resource, List<Fruit> objects) {
        super(context, resource, objects);
        resourceId = resource;
    }

    @Override
    public View getView(int position, View convertView, ViewGroup parent) {
        Fruit fruit = getItem(position);

        View view;
        ViewHolder viewHolder;

        if (convertView == null) {
            view = LayoutInflater.from(getContext()).inflate(resourceId, parent, false);
            viewHolder = new ViewHolder(view.findViewById(R.id.fruit_image), view.findViewById(R.id.fruit_english_name), view.findViewById(R.id.fruit_chinese_name));
            view.setTag(viewHolder);
        } else {
            view = convertView;
            viewHolder = (ViewHolder) view.getTag();
        }

        viewHolder.fruitImage.setImageResource(fruit.getImageId());
        viewHolder.fruitEnglishName.setText(fruit.getEnglishName());
        viewHolder.fruitChineseName.setText(fruit.getChineseName());

        return view;
    }

    class ViewHolder {
        ImageView fruitImage;
        TextView fruitEnglishName;
        TextView fruitChineseName;

        public ViewHolder(ImageView fruitImage, TextView fruitEnglishName, TextView fruitChineseName) {
            this.fruitImage = fruitImage;
            this.fruitEnglishName = fruitEnglishName;
            this.fruitChineseName = fruitChineseName;
        }
    }
}
