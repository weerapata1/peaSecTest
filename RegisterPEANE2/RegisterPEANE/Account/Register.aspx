<%@ Page Title="Register" Language="C#" MasterPageFile="~/Site.Master" AutoEventWireup="true" CodeBehind="Register.aspx.cs" Inherits="RegisterPEANE.Account.Register" %>

<asp:Content runat="server" ID="BodyContent" ContentPlaceHolderID="MainContent">
    <h2><%: Title %>.</h2>
    <p class="text-danger">
        <asp:Literal runat="server" ID="ErrorMessage" />
    </p>

    <div class="form-horizontal">
        <h4>Create a new account</h4>
        <hr />
        <asp:ValidationSummary runat="server" CssClass="text-danger" />
        


        
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtname" CssClass="col-md-2 control-label">ชื่อ-นามสกุล</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtname" CssClass="form-control"  />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtname"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="txtmobile" CssClass="col-md-2 control-label">โทรศัพท์</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="txtmobile" CssClass="form-control" TextMode="Phone" />
                <asp:CheckBox ID="cb_mobile" Text="ไม่เปิดเผยข้อมูล" runat="server" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="txtmobile"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="f_profile" CssClass="col-md-2 control-label">รูปภาพ Profile</asp:Label>
            <div class="col-md-10">
                <asp:FileUpload ID="f_profile" runat="server"  CssClass="form-control" />
                <%--<asp:TextBox runat="server" ID="TextBox4" CssClass="form-control" TextMode="Email" />--%>
                <asp:RequiredFieldValidator runat="server" ControlToValidate="f_profile"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>> 
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ddlProg" CssClass="col-md-2 control-label">ภาษา Programmimg</asp:Label>
            <div class="col-md-10">
                <asp:DropDownList ID="ddlProg" runat="server"  CssClass="form-control">
                    <asp:ListItem>--Please Select---</asp:ListItem>
                    <asp:ListItem>C#</asp:ListItem>
                    <asp:ListItem>JAVA</asp:ListItem>
                    <asp:ListItem>PHP</asp:ListItem>
                    <asp:ListItem>Python</asp:ListItem>
                    <asp:ListItem>JavaScript</asp:ListItem>
                </asp:DropDownList> 
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ddlProg"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Email" CssClass="col-md-2 control-label">Username</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Email" CssClass="form-control" TextMode="Email" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Email"
                    CssClass="text-danger" ErrorMessage="The email field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="Password" CssClass="col-md-2 control-label">Password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="Password" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="Password"
                    CssClass="text-danger" ErrorMessage="The password field is required." />
            </div>
        </div>
        <div class="form-group">
            <asp:Label runat="server" AssociatedControlID="ConfirmPassword" CssClass="col-md-2 control-label">Confirm password</asp:Label>
            <div class="col-md-10">
                <asp:TextBox runat="server" ID="ConfirmPassword" TextMode="Password" CssClass="form-control" />
                <asp:RequiredFieldValidator runat="server" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The confirm password field is required." />
                <asp:CompareValidator runat="server" ControlToCompare="Password" ControlToValidate="ConfirmPassword"
                    CssClass="text-danger" Display="Dynamic" ErrorMessage="The password and confirmation password do not match." />
            </div>
        </div>


        <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Submit" CssClass="btn btn-default" />
            </div>
        </div>

         <div class="form-group">
            <div class="col-md-offset-2 col-md-10">
                <asp:Button runat="server" OnClick="CreateUser_Click" Text="Reset" CssClass="btn btn-default" />
            </div>
        </div>









    </div>
</asp:Content>
