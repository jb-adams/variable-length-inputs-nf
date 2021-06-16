print("Attempting to have variable length of inputs")

print("experiment 0: printing all params")
print("all params:")
print(params)
print("")

print("experiment 1: printing param value based on presence")
print("is there a param called foo?")
if (params.containsKey("foo")) {
    print("foo found")
    print(params["foo"])
} else {
    print("foo not found")
}

print("is there a param called bar?")
if (params.containsKey("bar")) {
    print("bar found")
    print(params["bar"])
} else {
    print("bar not found")
}

print("is there a param called baz?")
if (params.containsKey("baz")) {
    print("baz found")
    print(params["baz"])
} else {
    print("baz not found")
}

print ("experiment 2: accessing params through a loop")
i = 0
iterate = true
valid = true
names = ""
print("entering while loop")
while(iterate) {
    print("i is " + i)
    firstname_param = "firstname_" + i
    lastname_param = "lastname_" + i

    if (params.containsKey(firstname_param)) {
        print(firstname_param + " found" )
        print(params[firstname_param])

        if (params.containsKey(lastname_param)) {
            print(lastname_param + " found")
            print(params[lastname_param])
            // names = names.concat(params[firstname_param] + "," + params[lastname_param] + ";")
            names = names.concat(params[firstname_param] + "," + params[lastname_param] + "\n")
        } else {
            print(lastname_param + " not found, even though " + firstname_param + " was specified. Invalid construction, not proceeding")
            iterate = false
            valid = false
        }

    } else {
        print(firstname_param + " not found")
        iterate = false;
        if (i ==0) {
            print("no inputs to populate design file.")
            valid = false
        }
    }

    i++
}
names = names.substring(0, names.length() - 1)
print("done while loop")

print("were the inputs valid?")
print(valid)

if (valid) {
    print("the inputs were valid, making table csv")
    print(names)

    process make_table {
        output:
        file 'names.csv' into names_file

        script:
        """
        echo -e "firstname,lastname" > names.csv
        echo -e "${names}" >> names.csv
        """

        // echo -e "${names}" | tr ';' '\n' >> names.csv

    }
}

