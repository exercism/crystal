require "spec"
require "file_utils"
require "webmock"
require "../src/remote_data_file"

TEST_URL = [RemoteDataFile::BASE_URL, "test-exercise", RemoteDataFile::DATA_FILE].join("/")
TEST_DIR = File.expand_path(File.join("..", "..", "cache", "test-exercise"), __FILE__)

describe "RemoteDataFile" do
  describe "#path" do
    context "when successful" do
      Spec.before_each do
        clean_test_files
        WebMock.reset
      end

      Spec.after_each do
        clean_test_files
      end

      it "returns the response body if status is 200" do
        WebMock.stub(:get, TEST_URL).to_return(status: 200, body: "file body")

        remote_data_file = RemoteDataFile.new("test-exercise")

        File.read(remote_data_file.path).should eq("file body")
      end
    end

    context "when successful" do
      it "raises a not found exception if status is 404" do
        WebMock.stub(:get, TEST_URL).to_return(status: 404, body: "")

        error_message = "A #{RemoteDataFile::DATA_FILE} doesn't exist for test-exercise in x-common. " +
                        "Go make one!"

        expect_raises(Exception, error_message) do
          RemoteDataFile.new("test-exercise").path
        end
      end

      it "raises a unexpected exception if status is other than 200 or 404" do
        WebMock.stub(:get, TEST_URL).to_return(status: 500, body: "")


        error_message = "Error while requesting the test-exercise data file from GitHub... " +
                        "Status was 500"
        expect_raises(Exception, error_message) do
          RemoteDataFile.new("test-exercise").path
        end
      end
    end
  end
end

def clean_test_files
  FileUtils.rm_rf(TEST_DIR)
end
