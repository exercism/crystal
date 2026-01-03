require "spec"
require "../src/*"

describe "RelativeDistance" do
  it "Direct parent-child relation" do
    family_tree = {"Vera" => ["Tomoko"], "Tomoko" => ["Aditi"]}
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Vera", "Tomoko").should eq(1)
  end

  pending "Sibling relationship" do
    family_tree = {"Dalia" => ["Olga", "Yassin"]}
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Olga", "Yassin").should eq(1)
  end

  pending "Two degrees of separation, grandchild" do
    family_tree = {"Khadija" => ["Mateo"], "Mateo" => ["Rami"]}
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Khadija", "Rami").should eq(2)
  end

  pending "Unrelated individuals" do
    family_tree = {"Priya" => ["Rami"], "Kaito" => ["Elif"]}
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Priya", "Kaito").should eq(nil)
  end

  pending "Complex graph, cousins" do
    family_tree = {
      "Aiko" => ["Bao", "Carlos"], "Bao" => ["Dalia", "Elias"], "Carlos" => ["Fatima", "Gustavo"],
      "Dalia" => ["Hassan", "Isla"], "Elias" => ["Javier"], "Fatima" => ["Khadija", "Liam"], "Gustavo" => ["Mina"],
      "Hassan" => ["Noah", "Olga"], "Isla" => ["Pedro"], "Javier" => ["Quynh", "Ravi"], "Khadija" => ["Sofia"],
      "Liam" => ["Tariq", "Uma"], "Mina" => ["Viktor", "Wang"], "Noah" => ["Xiomara"], "Olga" => ["Yuki"],
      "Pedro" => ["Zane", "Aditi"], "Quynh" => ["Boris"], "Ravi" => ["Celine"], "Sofia" => ["Diego", "Elif"],
      "Tariq" => ["Farah"], "Uma" => ["Giorgio"], "Viktor" => ["Hana", "Ian"], "Wang" => ["Jing"],
      "Xiomara" => ["Kaito"], "Yuki" => ["Leila"], "Zane" => ["Mateo"], "Aditi" => ["Nia"], "Boris" => ["Oscar"],
      "Celine" => ["Priya"], "Diego" => ["Qi"], "Elif" => ["Rami"], "Farah" => ["Sven"], "Giorgio" => ["Tomoko"],
      "Hana" => ["Umar"], "Ian" => ["Vera"], "Jing" => ["Wyatt"], "Kaito" => ["Xia"], "Leila" => ["Yassin"],
      "Mateo" => ["Zara"], "Nia" => ["Antonio"], "Oscar" => ["Bianca"], "Priya" => ["Cai"], "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"], "Sven" => ["Fabio"], "Tomoko" => ["Gabriela"], "Umar" => ["Helena"], "Vera" => ["Igor"],
      "Wyatt" => ["Jun"], "Xia" => ["Kim"], "Yassin" => ["Lucia"], "Zara" => ["Mohammed"],
    }
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Dimitri", "Fabio").should eq(9)
  end

  pending "Complex graph, no shortcut, far removed nephew" do
    family_tree = {
      "Aiko" => ["Bao", "Carlos"], "Bao" => ["Dalia", "Elias"], "Carlos" => ["Fatima", "Gustavo"],
      "Dalia" => ["Hassan", "Isla"], "Elias" => ["Javier"], "Fatima" => ["Khadija", "Liam"], "Gustavo" => ["Mina"],
      "Hassan" => ["Noah", "Olga"], "Isla" => ["Pedro"], "Javier" => ["Quynh", "Ravi"], "Khadija" => ["Sofia"],
      "Liam" => ["Tariq", "Uma"], "Mina" => ["Viktor", "Wang"], "Noah" => ["Xiomara"], "Olga" => ["Yuki"],
      "Pedro" => ["Zane", "Aditi"], "Quynh" => ["Boris"], "Ravi" => ["Celine"], "Sofia" => ["Diego", "Elif"],
      "Tariq" => ["Farah"], "Uma" => ["Giorgio"], "Viktor" => ["Hana", "Ian"], "Wang" => ["Jing"],
      "Xiomara" => ["Kaito"], "Yuki" => ["Leila"], "Zane" => ["Mateo"], "Aditi" => ["Nia"], "Boris" => ["Oscar"],
      "Celine" => ["Priya"], "Diego" => ["Qi"], "Elif" => ["Rami"], "Farah" => ["Sven"], "Giorgio" => ["Tomoko"],
      "Hana" => ["Umar"], "Ian" => ["Vera"], "Jing" => ["Wyatt"], "Kaito" => ["Xia"], "Leila" => ["Yassin"],
      "Mateo" => ["Zara"], "Nia" => ["Antonio"], "Oscar" => ["Bianca"], "Priya" => ["Cai"], "Qi" => ["Dimitri"],
      "Rami" => ["Ewa"], "Sven" => ["Fabio"], "Tomoko" => ["Gabriela"], "Umar" => ["Helena"], "Vera" => ["Igor"],
      "Wyatt" => ["Jun"], "Xia" => ["Kim"], "Yassin" => ["Lucia"], "Zara" => ["Mohammed"],
    }
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Lucia", "Jun").should eq(14)
  end

  pending "Complex graph, some shortcuts, cross-down and cross-up, cousins several times removed, with unrelated family tree" do
    family_tree = {
      "Aiko" => ["Bao", "Carlos"], "Bao" => ["Dalia"], "Carlos" => ["Fatima", "Gustavo"], "Dalia" => ["Hassan", "Isla"],
      "Fatima" => ["Khadija", "Liam"], "Gustavo" => ["Mina"], "Hassan" => ["Noah", "Olga"], "Isla" => ["Pedro"],
      "Javier" => ["Quynh", "Ravi"], "Khadija" => ["Sofia"], "Liam" => ["Tariq", "Uma"], "Mina" => ["Viktor", "Wang"],
      "Noah" => ["Xiomara"], "Olga" => ["Yuki"], "Pedro" => ["Zane", "Aditi"], "Quynh" => ["Boris"],
      "Ravi" => ["Celine"], "Sofia" => ["Diego", "Elif"], "Tariq" => ["Farah"], "Uma" => ["Giorgio"],
      "Viktor" => ["Hana", "Ian"], "Wang" => ["Jing"], "Xiomara" => ["Kaito"], "Yuki" => ["Leila"],
      "Zane" => ["Mateo"], "Aditi" => ["Nia"], "Boris" => ["Oscar"], "Celine" => ["Priya"], "Diego" => ["Qi"],
      "Elif" => ["Rami"], "Farah" => ["Sven"], "Giorgio" => ["Tomoko"], "Hana" => ["Umar"], "Ian" => ["Vera"],
      "Jing" => ["Wyatt"], "Kaito" => ["Xia"], "Leila" => ["Yassin"], "Mateo" => ["Zara"], "Nia" => ["Antonio"],
      "Oscar" => ["Bianca"], "Priya" => ["Cai"], "Qi" => ["Dimitri"], "Rami" => ["Ewa"], "Sven" => ["Fabio"],
      "Tomoko" => ["Gabriela"], "Umar" => ["Helena"], "Vera" => ["Igor"], "Wyatt" => ["Jun"], "Xia" => ["Kim"],
      "Yassin" => ["Lucia"], "Zara" => ["Mohammed"],
    }
    relative_distance = RelativeDistance.new(family_tree)
    relative_distance.degree_of_separation?("Wyatt", "Xia").should eq(12)
  end
end
