# Crystal Power Real Estate Investment Management System
## Complete Setup Guide

---

## 📋 Table of Contents
1. [Quick Start (5 Minutes)](#quick-start)
2. [Detailed Setup Instructions](#detailed-setup)
3. [Formula Configuration](#formulas)
4. [Conditional Formatting](#formatting)
5. [Data Validation](#validation)
6. [Access Control](#access)
7. [Troubleshooting](#troubleshooting)
8. [Maintenance Schedule](#maintenance)

---

## 🚀 Quick Start (5 Minutes) {#quick-start}

### Step 1: Import CSV Files to Google Sheets

1. Open Google Sheets (https://sheets.google.com)
2. Create a new blank spreadsheet
3. For **each of the 4 CSV files**, do the following:
   - Go to **File → Import → Upload**
   - Select the CSV file
   - Choose **"Replace spreadsheet"** for the first file
   - Choose **"Insert new sheet(s)"** for subsequent files
   - Click **Import data**

**Files to import in order:**
- `01_Assets_Master.csv`
- `02_Payment_Tracking.csv`
- `03_Investor_Registry.csv`
- `04_Dashboard_Metrics.csv`

### Step 2: Rename Sheet Tabs

Rename the imported sheets to:
- **Assets Master**
- **Payment Tracking**
- **Investor Registry**
- **Dashboard**

### Step 3: Set Up Cross-Sheet Formulas

**In Investor Registry sheet:**

For Eng. Mostafa Al-Qadi (Row 2):
```
C2 (Total Investment): =SUMIF('Assets Master'!F:F,A2,'Assets Master'!G:G)
D2 (Number of Properties): =COUNTIF('Assets Master'!F:F,A2)
E2 (Total Portfolio Value): =SUMIF('Assets Master'!F:F,A2,'Assets Master'!L:L)
F2 (Portfolio ROI): =(E2-C2)/C2*100
```

Copy these formulas down for all investors.

### Step 4: Apply Conditional Formatting to Payment Tracking

Select column J (Days_Late) and apply color scale:
- **Green**: 0-15 days
- **Yellow**: 16-30 days
- **Orange**: 31-60 days
- **Red**: 61+ days

**You're ready to use the system!**

---

## 📖 Detailed Setup Instructions {#detailed-setup}

### System Architecture

The Crystal Power Real Estate Investment Management System consists of **4 interconnected Google Sheets**:

1. **Assets Master** - Central property database
2. **Payment Tracking** - Payment collection and aging
3. **Investor Registry** - Investor profiles and performance
4. **Dashboard** - Real-time KPIs and metrics

### Prerequisites

- Google Account
- Google Sheets access
- Basic spreadsheet knowledge
- The 4 CSV files from this package

### Complete Import Process

#### Importing Assets Master

1. Open Google Sheets
2. Create new spreadsheet
3. **File → Import → Upload**
4. Select `01_Assets_Master.csv`
5. **Import location**: Replace spreadsheet
6. **Separator type**: Comma
7. **Convert text to numbers**: Yes
8. Click **Import data**
9. Rename tab to "Assets Master"

#### Importing Payment Tracking

1. In the same spreadsheet
2. **File → Import → Upload**
3. Select `02_Payment_Tracking.csv`
4. **Import location**: Insert new sheet(s)
5. **Separator type**: Comma
6. Click **Import data**
7. Rename tab to "Payment Tracking"

#### Importing Investor Registry

1. **File → Import → Upload**
2. Select `03_Investor_Registry.csv`
3. **Import location**: Insert new sheet(s)
4. **Separator type**: Comma
5. Click **Import data**
6. Rename tab to "Investor Registry"

#### Importing Dashboard Metrics

1. **File → Import → Upload**
2. Select `04_Dashboard_Metrics.csv`
3. **Import location**: Insert new sheet(s)
4. **Separator type**: Comma
5. Click **Import data**
6. Rename tab to "Dashboard"

---

## 🔧 Formula Configuration {#formulas}

### Assets Master Formulas

**ROI Calculation (Column U: Expected_ROI)**

Row 2 formula:
```
=(L2-K2)/K2*100
```

Where:
- L2 = Current_Market_Value
- K2 = Purchase_Price

**What it does**: Calculates return on investment as a percentage

Copy this formula down for all property rows.

---

### Payment Tracking Formulas

**Days Late Calculation (Column J)**

Row 2 formula:
```
=IF(H2="Not Paid",TODAY()-G2,IF(F2>G2,F2-G2,0))
```

Where:
- H2 = Payment_Status
- G2 = Expected_Payment_Date
- F2 = Actual_Payment_Date

**What it does**: 
- If payment is "Not Paid", calculates days since expected date
- If payment is received late, calculates the delay
- If payment is on time or early, shows 0

**Late Fee Calculation (Column L: Late_Fee_Amount)**

Row 2 formula:
```
=IF(J2>30,I2*0.05,0)
```

Where:
- J2 = Days_Late
- I2 = Amount_Due

**What it does**: Applies 5% penalty if payment is more than 30 days late

**Total Amount Due (Column M)**

Row 2 formula:
```
=I2+L2
```

Where:
- I2 = Amount_Due
- L2 = Late_Fee_Amount

---

### Investor Registry Formulas

**Total Investment (Column E)**

Row 2 formula:
```
=SUMIF('Assets Master'!F:F,A2,'Assets Master'!G:G)
```

Where:
- 'Assets Master'!F:F = Investor_Name column in Assets Master
- A2 = Current investor name
- 'Assets Master'!G:G = Investment_Amount column

**What it does**: Sums all investments by this investor across all properties

**Number of Properties (Column F)**

Row 2 formula:
```
=COUNTIF('Assets Master'!F:F,A2)
```

**What it does**: Counts how many properties this investor owns

**Total Portfolio Value (Column G)**

Row 2 formula:
```
=SUMIF('Assets Master'!F:F,A2,'Assets Master'!L:L)
```

**What it does**: Sums current market values of all properties owned by investor

**Portfolio ROI (Column H)**

Row 2 formula:
```
=(G2-E2)/E2*100
```

**What it does**: Calculates investor's overall return on investment percentage

---

### Dashboard Metrics Formulas

**Total Portfolio Value**

```
=SUM('Assets Master'!L:L)
```

**Overall ROI**

```
=(SUM('Assets Master'!L:L) - SUM('Assets Master'!K:K)) / SUM('Assets Master'!K:K) * 100
```

**Collection Rate**

```
=COUNTIFS('Payment Tracking'!H:H,"Received")/COUNTA('Payment Tracking'!H:H)*100
```

**Total Outstanding Payments**

```
=SUMIF('Payment Tracking'!H:H,"<>Received",'Payment Tracking'!M:M)
```

**Number of Overdue Payments**

```
=COUNTIF('Payment Tracking'!H:H,"Overdue")
```

**Average Days Late**

```
=AVERAGE('Payment Tracking'!J:J)
```

---

## 🎨 Conditional Formatting {#formatting}

### Payment Tracking - Days Late Color Coding

**Purpose**: Visual indicator of payment aging status

**Steps**:

1. Select column J (Days_Late) - entire column
2. **Format → Conditional formatting**
3. Add **4 rules** with these settings:

#### Rule 1: Green (0-15 days)
- Format cells if: Custom formula is
- Formula: `=AND(J2>=0, J2<=15)`
- Formatting style: Green background
- Range: J2:J1000

#### Rule 2: Yellow (16-30 days)
- Format cells if: Custom formula is
- Formula: `=AND(J2>=16, J2<=30)`
- Formatting style: Yellow background
- Range: J2:J1000

#### Rule 3: Orange (31-60 days)
- Format cells if: Custom formula is
- Formula: `=AND(J2>=31, J2<=60)`
- Formatting style: Orange background
- Range: J2:J1000

#### Rule 4: Red (61+ days)
- Format cells if: Custom formula is
- Formula: `=J2>=61`
- Formatting style: Red background
- Range: J2:J1000

### Payment Tracking - Status Color Coding

**Additional formatting for Payment_Status column (H)**:

1. Select column H
2. **Format → Conditional formatting**

#### Received Status (Green)
- Formula: `=H2="Received"`
- Format: Green text, light green background

#### Overdue Status (Red)
- Formula: `=H2="Overdue"`
- Format: Red text, light red background

#### Pending Status (Orange)
- Formula: `=H2="Pending"`
- Format: Orange text, light orange background

---

## ✅ Data Validation {#validation}

### Payment Tracking - Payment Status Dropdown

**Purpose**: Ensure consistent status values

1. Select column H (Payment_Status)
2. **Data → Data validation**
3. Criteria: List of items
4. Items: `Received, Pending, Overdue, Cancelled`
5. Show dropdown: ✓
6. Reject invalid: ✓

### Assets Master - Listing Status Dropdown

1. Select column P (Listing_Status)
2. **Data → Data validation**
3. Criteria: List of items
4. Items: `Not Listed, Listed, Under Contract, Sold`
5. Show dropdown: ✓

### Assets Master - Property Type Dropdown

1. Select column J (Property_Type)
2. **Data → Data validation**
3. Criteria: List of items
4. Items: `Single Family Villa, Villa, Apartment, Townhouse, Duplex, Commercial`
5. Show dropdown: ✓

---

## 🔐 Access Control {#access}

### Sharing Settings

**For collaborative use (5+ users):**

1. Click **Share** button (top-right)
2. Change general access to: **Anyone with the link**
3. Set permission: **Editor** (for team members)
4. For stakeholders: **Viewer** or **Commenter**

### Recommended Access Levels

- **CEO/Owner**: Owner
- **Finance Team**: Editor
- **Property Managers**: Editor (limited sheets)
- **Investors**: Viewer (specific sheets only)
- **Auditors**: Viewer (read-only)

### Sheet Protection (Optional)

To protect critical sheets:

1. Right-click sheet tab
2. **Protect sheet**
3. Set permissions: Only specific people can edit
4. Add authorized users

**Recommended protection:**
- Dashboard: Protected (formula-driven)
- Investor Registry: Protected (sensitive data)
- Assets Master: Editor access (team needs to update)
- Payment Tracking: Editor access (active management)

---

## 🛠️ Troubleshooting {#troubleshooting}

### Common Issues and Solutions

#### Issue: Formulas showing #REF! error

**Cause**: Sheet names don't match formula references

**Solution**: 
- Ensure sheets are named exactly: "Assets Master", "Payment Tracking", "Investor Registry", "Dashboard"
- Check for extra spaces in sheet names
- Re-enter formulas with correct sheet names

#### Issue: Days Late showing negative numbers

**Cause**: Date format not recognized

**Solution**:
1. Select date columns
2. **Format → Number → Date**
3. Recalculate formulas

#### Issue: Conditional formatting not working

**Cause**: Formula range incorrect or rules in wrong order

**Solution**:
1. Delete existing conditional formatting rules
2. Re-apply rules following the guide above
3. Ensure ranges cover all data rows (e.g., J2:J1000)

#### Issue: Cross-sheet formulas not calculating

**Cause**: Sheet references incorrect

**Solution**:
1. Verify sheet names match exactly
2. Check that cell references are correct
3. Use single quotes around sheet names with spaces: `'Assets Master'!A1`

#### Issue: ROI calculations showing error

**Cause**: Division by zero or non-numeric values

**Solution**:
1. Check Purchase_Price column (K) has no zero values
2. Ensure both Purchase_Price and Current_Market_Value are numbers
3. Use error handling: `=IFERROR((L2-K2)/K2*100, 0)`

---

## 📅 Maintenance Schedule {#maintenance}

### Daily Tasks
- [ ] Update Payment_Status for received payments
- [ ] Record Actual_Payment_Date for new payments
- [ ] Review Days_Late for approaching deadlines

### Weekly Tasks
- [ ] Follow up on payments 15+ days late
- [ ] Update Current_Market_Value for active listings
- [ ] Review Dashboard metrics for trends
- [ ] Send payment reminders via Zapier (if configured)

### Monthly Tasks
- [ ] Generate investor reports
- [ ] Update property valuations
- [ ] Review and update Marketing_Strategy
- [ ] Reconcile Payment Tracking with bank statements
- [ ] Archive completed payment records

### Quarterly Tasks
- [ ] Comprehensive portfolio review
- [ ] Investor performance analysis
- [ ] Update investment targets on Dashboard
- [ ] Review and update insurance premiums
- [ ] Property tax reassessment

### Annual Tasks
- [ ] Full property revaluation
- [ ] Update Insurance_Annual_Premium
- [ ] Update Property_Tax_Annual
- [ ] Strategic portfolio rebalancing
- [ ] Investor annual reports

---

## 📞 Support and Resources

**System Documentation**: This guide and accompanying files

**Google Sheets Help**: https://support.google.com/sheets

**Formula Reference**: https://support.google.com/docs/table/25273

**Conditional Formatting Guide**: https://support.google.com/docs/answer/78413

**For technical assistance with this system**:
- Contact: Crystal Power Investments
- CEO: Mo'men Maisara
- Email: m.maisara@crystalpower.com

---

## 🎯 Next Steps

1. ✅ Complete CSV import
2. ✅ Set up cross-sheet formulas
3. ✅ Apply conditional formatting
4. ✅ Configure data validation
5. ✅ Set up sharing and access control
6. ⏭️ Integrate with Zapier (see `06_Zapier_Integration_Guide.md`)
7. ⏭️ Follow 4-week implementation plan (see `08_4-Week_Implementation_Checklist.md`)

---

**System Version**: 1.0  
**Last Updated**: March 2024  
**Created for**: Crystal Power Investments  
**"We only win, When you do"**
