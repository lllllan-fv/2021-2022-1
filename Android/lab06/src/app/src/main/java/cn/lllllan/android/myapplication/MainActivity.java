package cn.lllllan.android.myapplication;

import android.os.Bundle;
import android.view.View;
import android.view.Window;
import android.widget.AdapterView;
import android.widget.Button;
import android.widget.ListView;
import android.widget.Toast;

import androidx.appcompat.app.AppCompatActivity;

import java.util.ArrayList;
import java.util.List;

@SuppressWarnings({"all"})

public class MainActivity extends AppCompatActivity {

    private int[] imagesId = new int[]{
            R.drawable.apple_pic, R.drawable.banana_pic, R.drawable.cherry_pic, R.drawable.grape_pic,
            R.drawable.mango_pic, R.drawable.orange_pic, R.drawable.pear_pic, R.drawable.pineapple_pic,
            R.drawable.strawberry_pic, R.drawable.watermelon_pic
    };

    private String[] chineseNames = new String[]{
            "苹果", "香蕉", "樱桃", "葡萄", "芒果", "橙子", "梨", "菠萝", "草莓", "西瓜",
    };

    private String[] englishNames = new String[]{
            "apple", "banana", "cherry", "grape", "mango", "orange", "pear", "pineapple", "strawberry", "watermelon",
    };

    private List<Fruit> fruitList = new ArrayList<>();

    @Override
    protected void onCreate(Bundle savedInstanceState) {
        super.onCreate(savedInstanceState);
        supportRequestWindowFeature(Window.FEATURE_NO_TITLE);
        setContentView(R.layout.activity_main);

        initFruits();
        FruitAdapter fruitAdapter = new FruitAdapter(MainActivity.this, R.layout.fruit_item, fruitList);
        ListView listView = findViewById(R.id.list_view);
        listView.setAdapter(fruitAdapter);

        listView.setOnItemClickListener(new AdapterView.OnItemClickListener() {
            @Override
            public void onItemClick(AdapterView<?> adapterView, View view, int pos, long id) {
                Fruit fruit = fruitList.get(pos);

                view.findViewById(R.id.fruit_image).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Toast.makeText(MainActivity.this, "You click image of " + fruit.getEnglishName(), Toast.LENGTH_SHORT).show();
                    }
                });

                view.findViewById(R.id.fruit_english_name).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Toast.makeText(MainActivity.this, fruit.getEnglishName(), Toast.LENGTH_SHORT).show();
                    }
                });

                view.findViewById(R.id.fruit_chinese_name).setOnClickListener(new View.OnClickListener() {
                    @Override
                    public void onClick(View view) {
                        Toast.makeText(MainActivity.this, fruit.getChineseName(), Toast.LENGTH_SHORT).show();
                    }
                });

                Toast.makeText(MainActivity.this, fruit.getEnglishName(), Toast.LENGTH_SHORT).show();
            }
        });

        Button btn = findViewById(R.id.search_bar_button);
        btn.setOnClickListener(new View.OnClickListener() {
            @Override
            public void onClick(View view) {
                Toast.makeText(MainActivity.this, "click", Toast.LENGTH_SHORT).show();
            }
        });
    }

    private void initFruits() {
        for (int i = 0; i < imagesId.length; ++i) {
            fruitList.add(new Fruit(imagesId[i], englishNames[i], chineseNames[i]));
        }
    }
}