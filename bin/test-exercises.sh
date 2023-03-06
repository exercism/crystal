
dic=$(mktemp -d)
mkdir -p "${dic}/src"
mkdir -p "${dic}/spec"

test_run() {
    echo "Testing $1"
    cat "$1/.meta/src/$2.cr"> "${dic}/src/$2.cr"
    spec_file="$1/$(jq -r '.files.test[0]' $1/.meta/config.json)"
    cat "${spec_file}" > "${dic}/spec/spec.cr"
    sed -i -e 's/pending/it/g' ${dic}/spec/spec.cr
    crystal spec ${dic}/spec/spec.cr || exit 1
}

for exercise in ./exercises/practice/*; do
    test_run ${exercise} "example"
done

for exercise in ./exercises/concepts/*; do
    test_run ${exercise} "exemplar"
done
