
dic=$(mktemp -d)
mkdir -p "${dic}/src"
mkdir -p "${dic}/spec"
echo $(crystal -v)

test_run() {
    echo "Testing $1"
    cat "$1/.meta/src/$2.cr" > "${dic}/src/$2.cr"
    spec_file="$1/$(jq -r '.files.test[0]' $1/.meta/config.json)"
    cat "${spec_file}" > "${dic}/spec/spec.cr"
    sed -i -e 's/pending/it/g' ${dic}/spec/spec.cr
    crystal spec ${dic}/spec/spec.cr $3 || exit 1
}

crystal_version_at_least() {
    required_version="$1"
    current_version="$(crystal -v | head -n1 | awk '{print $2}' | sed 's/[^0-9.].*$//')"

    [ "$(printf '%s\n%s\n' "${required_version}" "${current_version}" | sort -V | head -n1)" = "${required_version}" ]
}

for exercise in ./exercises/practice/*; do
    if [ "$(basename "${exercise}")" != "parallel-letter-frequency" ]; then
        test_run ${exercise} "example"
    elif crystal_version_at_least "1.19.0"; then
        test_run ${exercise} "example" "-D preview_mt"
    fi
done

if [ -d "./exercises/concept" ]; then
    for exercise in ./exercises/concept/*; do
        test_run ${exercise} "exemplar"
    done
fi
