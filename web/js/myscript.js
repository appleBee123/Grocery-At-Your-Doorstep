function findsum()
{
    var first = document.getElementById("tbfirst").value;
    var second = document.getElementById("tbsecond").value;
    if(first == "")
    {
        alert("Enter first number");
    }
    else if(second == "")
    {
        alert("Enter second number");
    }
    else if(isNaN(first))
    {
        alert("Invalid first number");
    }
    else if(isNaN(second))
    {
        alert("Invalid second number");
    }
    else
    {
        var sum =  parseInt(first) + parseInt(second);
        document.getElementById("lbsum").innerHTML ="Sum is = " + sum;
    }
}
