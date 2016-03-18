public class Qnumber {
 
    private String name;
    private String shortCode;
     
    public Qnumber(String n, String c){
        this.name=n;
        this.shortCode=c;
    }
     
    public String getName() {
        return name;
    }
    public void setName(String name) {
        this.name = name;
    }
    public String getShortCode() {
        return shortCode;
    }
    public void setShortCode(String shortCode) {
        this.shortCode = shortCode;
    }
     
    @Override
    public String toString(){
        return name + "::" + shortCode;
    }
     
}