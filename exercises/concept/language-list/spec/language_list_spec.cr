require "spec"
require "../src/*"

describe "LanguageList" do
  describe "list", tags: "task_id=1" do
    it "new array" do
      language_list = LanguageList.list
      language_list.should eq [] of String
    end
  end

  describe "add", tags: "task_id=2" do
    it "add a language to an array" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list.should eq ["Crystal"]
    end

    it "add several languages to an array" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.add(language_list, "C#")
      language_list = LanguageList.add(language_list, "Java")
      language_list.should eq ["Crystal", "Ruby", "C#", "Java"]
    end
  end

  describe "remove", tags: "task_id=3" do
    it "add then remove results in empty list" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.remove(language_list)
      language_list.should eq [] of String
    end

    it "adding two languages, when removed, removes last item" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.remove(language_list)
      language_list.should eq ["Crystal"]
    end
  end

  describe "at", tags: "task_id=4" do
    it "add one language, then get the first language" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      LanguageList.at(language_list, 0).should eq "Crystal"
    end

    it "add a few languages, then get the 2nd language" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.add(language_list, "C#")
      language_list = LanguageList.add(language_list, "Java")
      LanguageList.at(language_list, 1).should eq "Ruby"
    end

    it "add a few languages, then get the last language" do
      language_list = LanguageList.list
      language_list = LanguageList.add(language_list, "Crystal")
      language_list = LanguageList.add(language_list, "Ruby")
      language_list = LanguageList.add(language_list, "C#")
      language_list = LanguageList.add(language_list, "Java")
      LanguageList.at(language_list, 3).should eq "Java"
    end
  end

  describe "parse", tags: "task_id=5" do
    it "can parse a string with only one language" do
      language_list = LanguageList.parse("Crystal")
      language_list.should eq ["Crystal"]
    end

    it "can parse a string with multiple languages" do
      language_list = LanguageList.parse("Crystal, Ruby, C#, Java")
      language_list.should eq ["Crystal", "Ruby", "C#", "Java"]
    end

    it "can parse a string with a language made of 2 words" do
      language_list = LanguageList.parse("Crystal, Ruby, C#, Visual Basic, Java, C++")
      language_list.should eq ["Crystal", "Ruby", "C#", "Visual Basic", "Java", "C++"]
    end
  end
end
