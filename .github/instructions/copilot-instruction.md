## Rules

- The name for the **primary key** must be `PK`.  
- Variables with suffix **Tok** must be locked, and locked variables must have suffix `Tok`.  
- Procedure names must **not contain whitespaces**.  
- The first **19 field IDs** are reserved for primary key fields.  
- Enum identifiers must be within the **allowed range**.  
- **IP addresses** must not appear in the source code.  
- **FlowFields** must not be editable.  
- `Commit()` must include a **comment** to justify its existence.  
- **Hardcoded object IDs** in functions are not allowed.  
- **Caption** must be specified.  
- Procedure prototypes must **not end with a semicolon**.  
- Procedures must be **local or internal**.  
- ToolTips must **end with a dot**.  
- Positioning of **global variables, triggers, and methods** must be correct.  
- `Msg` and `Err` labels should **end with a dot**, and `Qst` labels with a **question mark**.  
- Internal methods must be invoked with **explicit parameters**.  
- Objects should **not have empty sections**.  
- Objects must have **Access/Extensible properties** defined.  
- **Local variable names** must not contain whitespace or wildcard symbols.  
- **Global variable names** must not contain whitespace or wildcard symbols.  
- **Parameter names** must not contain whitespace or wildcard symbols.  
- `GridLayout` property must **not have value `Rows`**.  
- Identifiers must have **at least one mandatory affix**.  
- **Empty captions** should be locked.  
- `SetAutoCalcFields` must **not be invoked on Normal fields**.  
- **Zero (0) Enum value** should be reserved for Empty Value.  
- Detect **conflicting ID, Name, or Type** for tables used in `TransferFields`.  
- Correct usage of the **Get method** must be followed.  
- Avoid **prohibited Option data type**.  
- Detect **unused parameters in global procedures**.  
- Detect **unused Enums or Pages** in the project.  
- Avoid **redundant use of DataClassification or ApplicationArea property**.  
- Avoid **redundant use of Editable property**.  
- Prevent **assignment of larger value in TableRelation**.  
- Detect **unused global procedures**.  
- Ensure **non-local event publishers** are correctly defined.  
- Ensure **Open and Close parentheses** are correctly used after `IsEmpty` and `Count`.  
- Temporary records should **not trigger table triggers**.  
- Add **`this` qualification** for global variables to improve readability.  
- Detect **duplicated keys**.  
- Enums without a 0 value must have an **InitValue** on their fields.  


## Rules
 
- Do **not add double quotes** if the table field name has only one word.  
- **Keys formatting:**
  - If a key has **one or no properties**, it should be formatted as a single line: `key(PK; "No.") { Clustered = true; }`  
  - If a key has **no properties**, it should be formatted as: `key(SK; "Name") { }`
  - If a key has **multiple properties** or multiple fields, format each property on a separate line with proper indentation.
- ToolTips should be created **on table fields**. If not available, then on pages. Do **not repeat ToolTips on page fields** if they are already defined on the table fields, as they will be automatically inherited.  
- **Page actions:**
  - There should be **only procedure calls in action triggers**; all business logic code should reside in **codeunits** or **tables**.
  - Action triggers should contain minimal code - ideally just a single procedure call.
  - Complex logic, data manipulation, and business rules must be moved to separate procedures in codeunits.
- If a page field has **only one parameter or none**, it should be formatted as:  
      field("No."; Rec."No.") { ToolTip = 'Specifies the number of the car.'; }  
- **DataClassification** does not need to be redefined if it is the same as the table level, unless it differs.
- **ToolTip** does not need to be redefined if it is described on the table field.
- **ApplicationArea** does not need to be redefined if it is the same as the table level, unless it differs.  
- Add **DrillDownPageId** and **LookupPageId** properties to tables if there is a list page for that table.  