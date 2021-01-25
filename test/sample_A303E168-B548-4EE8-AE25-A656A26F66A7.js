const v1 = {a:1337};
for (let v2 in v1) {
    {
        v2 = 1337;
        {
            const v4 = {a:v1};
            v2 = v4;
        }
    }
}
