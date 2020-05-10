<html>
    <head>

        <script>
            //function that display value
            function dis(val)
            {
                var exprStr = document.getElementsByName("exprStr")[0];

                // document.getElementById("exprStr").value+=val

                if(isNaN(val) || isNaN(exprStr.value.charAt(exprStr.value.length-1)))
                    exprStr.value = exprStr.value + " " + val;
                else
                    exprStr.value = exprStr.value + val;
            }

                // //function that evaluates the digit and return result
                // function solve()
                // {
                //     let x = document.getElementById("result").value
                //     let y = eval(x)
                //     document.getElementById("result").value = y
                // }

            //function that clear the display
            function clr()
            {
                document.getElementById("exprStr").value = ""
            }
        </script>
        <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/materialize/1.0.0/css/materialize.min.css">

    </head>
    <!-- create table -->
    <body>
    <div class="container row">
        <div class="col s4"></div>
        <div class="col s4">
            <div class="row " style="text-align: center;margin-top: 100px;"><h2 class="red accent-1" style="color:#ffffff;">Smit's
                Calculator</h2></div>
            <div class="row red lighten-5" style="padding-left: 10px;">
                <div style="margin-top: 50px;">
                    <form action="calculateExpr" method="POST">
                        <table border="1" class="table">
                            <tr>
                                <td colspan="5"><input type="text" id="exprStr" name="exprStr"/></td>
                            </tr>
                            <tr>
                                <td><input type="button" class="btn-large" onclick="dis('1')" value="1"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('2')" value="2"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('3')" value="3"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('/')" value="/"/></td>
                                <td><input type="button" class="btn-large" onclick="clr()" value="c" onclick="clr()"/>
                                </td>
                            </tr>
                            <tr>
                                <td><input type="button" class="btn-large" onclick="dis('4')" value="4"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('5')" value="5"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('6')" value="6"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('-')" value="-"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('(')" value="("/></td>
                            </tr>
                            <tr>
                                <td><input type="button" class="btn-large" onclick="dis('7')" value="7"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('8')" value="8"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('9')" value="9"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('+')" value="+"/></td>
                                <td><input type="button" class="btn-large" onclick="dis(')')" value=")"/></td>
                            </tr>
                            <tr>
                                <td><input type="button" class="btn-large" onclick="dis('.')" value="."/></td>
                                <td><input type="button" class="btn-large" onclick="dis('0')" value="0"/></td>
                                <td><input type="submit" class="btn-large submit" value="="/></td>
                                <td><input type="button" class="btn-large" onclick="dis('*')" value="*"/></td>
                                <td><input type="button" class="btn-large" onclick="dis('^')" value="^"/></td>
                            </tr>
                        </table>
                    </form>
                </div>
            </div>
        </div>
    </div>

    </body>
</html>
