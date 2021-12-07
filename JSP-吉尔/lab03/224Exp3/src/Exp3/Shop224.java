package Exp3;

public class Shop224 implements java.io.Serializable {
    private Item[] items;

    public Shop224() {
    }

    public Shop224(Item[] items) {
        this.items = items;
    }

    public double getAmount() {
        double amount = 0;
        for (int i = 0, len = items.length; i < len; ++i) {
            amount += items[i].getAmount();
        }
        return amount;
    }

    public double getDiscountPrice() {
        double amount = getAmount();
        if (amount < 100) {
            return amount;
        } else if (amount < 200) {
            return amount * 0.98;
        } else if (amount < 500) {
            return amount * 0.95;
        } else if (amount < 1000) {
            return amount * 0.90;
        } else {
            return amount * 0.90;
        }
    }

    public String getDiscount() {
        double amount = getAmount();
        if (amount < 100) {
            return "100%";
        } else if (amount < 200) {
            return "98%";
        } else if (amount < 500) {
            return "95%";
        } else if (amount < 1000) {
            return "90%";
        } else {
            return "90%";
        }
    }

    public Item[] getItems() {
        return items;
    }

    public void setItems(Item[] items) {
        this.items = items;
    }

    static class Item {
        private String name;
        private String price;
        private String num;

        public Item(String name, String price, String num) {
            this.name = name;
            this.price = price;
            this.num = num;
        }

        public double getAmount() {
            double p = Double.parseDouble(price);
            double n = Double.parseDouble(num);
            return p * n;
        }

        public String getName() {
            return name;
        }

        public void setName(String name) {
            this.name = name;
        }

        public String getPrice() {
            return price;
        }

        public void setPrice(String price) {
            this.price = price;
        }

        public String getNum() {
            return num;
        }

        public void setNum(String num) {
            this.num = num;
        }
    }
}
