# Zapier Integration Guide
## Automated Email Workflows for Payment Management

---

## 📋 Overview

This guide configures **5 automated Zapier workflows** to manage payment collections:

1. **Payment Reminder** (15-30 days late)
2. **Formal Notice** (30-60 days late)
3. **Collections Escalation** (60+ days late)
4. **Monthly Investor Report** (scheduled)
5. **New Property Alert** (property added)

---

## 🔧 Prerequisites

- Zapier account (Free or Paid)
- Google Sheets connected to Zapier
- Gmail or business email account
- Payment Tracking sheet configured

---

## 🚀 Workflow 1: Payment Reminder (15-30 Days Late)

### Trigger
- **App**: Google Sheets
- **Event**: New or Updated Spreadsheet Row
- **Sheet**: Payment Tracking
- **Trigger Column**: Days_Late

### Filter
- **Condition**: Days_Late is greater than or equal to 15
- **AND**: Days_Late is less than or equal to 30
- **AND**: Payment_Status is not "Received"

### Action
- **App**: Gmail
- **Event**: Send Email
- **To**: {{Investor_Email}} (from Investor Registry)
- **Subject**: Payment Reminder - Invoice {{Invoice_Number}}
- **Body**:

```
Dear {{Investor_Name}},

This is a friendly reminder that payment for Invoice {{Invoice_Number}} is currently {{Days_Late}} days overdue.

Property: {{Asset_ID}}
Payment Type: {{Payment_Type}}
Amount Due: {{Amount_Due}} EGP
Expected Date: {{Expected_Payment_Date}}

Please submit payment at your earliest convenience to avoid late fees.

Best regards,
Crystal Power Investments
"We only win, When you do"
```

---

## 🚨 Workflow 2: Formal Notice (30-60 Days Late)

### Trigger
- **App**: Google Sheets
- **Event**: New or Updated Spreadsheet Row
- **Sheet**: Payment Tracking

### Filter
- **Condition**: Days_Late >= 31
- **AND**: Days_Late <= 60
- **AND**: Payment_Status = "Overdue"

### Actions

**Action 1: Send Email to Investor**
```
Subject: URGENT: Overdue Payment Notice - Late Fees Applied

Dear {{Investor_Name}},

Your payment for Invoice {{Invoice_Number}} is now {{Days_Late}} days overdue.

Original Amount: {{Amount_Due}} EGP
Late Fee (5%): {{Late_Fee_Amount}} EGP
Total Due: {{Total_Amount_Due}} EGP

Immediate payment required to avoid further action.

Crystal Power Investments
Contact: +20 100 234 5678
```

**Action 2: Send Alert to CEO**
- **To**: m.maisara@crystalpower.com
- **Subject**: ALERT: Payment {{Invoice_Number}} - {{Days_Late}} Days Late
- **Body**: Collection action required for {{Investor_Name}}

---

## ⚖️ Workflow 3: Collections Escalation (60+ Days)

### Trigger
- **App**: Google Sheets
- **Event**: Updated Row
- **Sheet**: Payment Tracking

### Filter
- Days_Late >= 61
- Payment_Status = "Overdue"

### Actions

**Action 1: Final Notice Email**
```
Subject: FINAL NOTICE - Legal Action Pending

Dear {{Investor_Name}},

Payment {{Invoice_Number}} is now {{Days_Late}} days overdue.

Total Amount Due: {{Total_Amount_Due}} EGP

This is your final notice before legal proceedings begin.
Contact us immediately: m.maisara@crystalpower.com

Crystal Power Investments Legal Department
```

**Action 2: Update Payment Status**
- **App**: Google Sheets
- **Action**: Update Spreadsheet Row
- **Column**: Collection_Notes
- **Value**: "Legal action initiated - {{Days_Late}} days late"

**Action 3: Create Task**
- **App**: Google Tasks or Trello
- **Task**: Initiate legal collection for {{Investor_Name}}
- **Due Date**: Today + 7 days

---

## 📊 Workflow 4: Monthly Investor Report (Scheduled)

### Trigger
- **App**: Schedule by Zapier
- **Frequency**: Monthly (1st of month, 9:00 AM)

### Actions

**Action 1: Get Investor Data**
- **App**: Google Sheets
- **Action**: Lookup Spreadsheet Rows
- **Sheet**: Investor Registry
- **Search Column**: All

**Action 2: Get Portfolio Performance**
- **App**: Google Sheets  
- **Sheet**: Assets Master
- **Filter**: Investor_Name = {{Current Investor}}

**Action 3: Send Monthly Report**
- **App**: Gmail
- **To**: {{Investor_Email}}
- **Subject**: Monthly Investment Report - {{Month}} {{Year}}
- **Body**:

```
Dear {{Investor_Name}},

Your Monthly Investment Summary:

📊 PORTFOLIO OVERVIEW
Total Investment: {{Total_Investment}} EGP
Current Value: {{Total_Portfolio_Value}} EGP
ROI: {{Portfolio_ROI}}%
Number of Properties: {{Number_of_Properties}}

💰 PAYMENT STATUS
Payments Received This Month: {{Count}}
Outstanding Balance: {{Amount}}

📈 PERFORMANCE
Month-over-Month Growth: {{Percentage}}
Year-to-Date Return: {{Percentage}}

View full details: [Link to Google Sheets]

Best regards,
Crystal Power Investments
"We only win, When you do"
```

---

## 🏠 Workflow 5: New Property Alert

### Trigger
- **App**: Google Sheets
- **Event**: New Spreadsheet Row
- **Sheet**: Assets Master

### Actions

**Action 1: Send Alert to All Investors**
- **App**: Gmail
- **To**: Multiple recipients from Investor Registry
- **Subject**: New Investment Opportunity - {{Property_Address}}
- **Body**:

```
Dear Valued Investors,

New property available for investment:

🏠 PROPERTY DETAILS
Address: {{Property_Address}}, {{City}}
Type: {{Property_Type}}
Purchase Price: {{Purchase_Price}} EGP
Expected ROI: {{Expected_ROI}}%
Size: {{Bedrooms}} Bed / {{Bathrooms}} Bath

💰 INVESTMENT OPPORTUNITY
This property presents an attractive investment opportunity with strong ROI potential.

Contact Mo'men Maisara for details: m.maisara@crystalpower.com

Crystal Power Investments
"We only win, When you do"
```

**Action 2: Post to Slack/Teams (Optional)**
- Share new property details with internal team

---

## 📝 Setup Instructions

### Step 1: Connect Google Sheets to Zapier

1. Log in to Zapier (https://zapier.com)
2. Create New Zap
3. Select Google Sheets as trigger app
4. Authorize your Google account
5. Select your Crystal Power Real Estate spreadsheet

### Step 2: Configure Each Workflow

For each of the 5 workflows above:

1. Create a new Zap
2. Set up the Trigger according to specifications
3. Add Filter conditions if specified
4. Configure Action(s)
5. Test the Zap with sample data
6. Turn Zap ON

### Step 3: Test Workflows

**Testing Payment Reminder:**
1. Manually set a payment's Days_Late to 20
2. Verify email is sent within 5 minutes
3. Check email content is properly formatted

**Testing Monthly Report:**
1. Set trigger to run "immediately" for testing
2. Verify all investors receive reports
3. Check data accuracy

---

## 🎯 Best Practices

1. **Email Deliverability**: Use professional email domain
2. **Rate Limiting**: Space out bulk emails (monthly reports)
3. **Testing**: Always test with dummy data first
4. **Monitoring**: Check Zap history weekly for errors
5. **Updates**: Review automation rules quarterly

---

## 💰 Cost Analysis

**Zapier Pricing** (as of 2024):
- **Free Plan**: 100 tasks/month (5 single-step Zaps)
- **Starter Plan**: $19.99/month (750 tasks, 20 Zaps)
- **Professional**: $49/month (2,000 tasks, unlimited Zaps)

**Recommended**: Starter Plan ($19.99/month) for Crystal Power's needs

---

## 🔧 Troubleshooting

**Issue**: Emails not sending
- Check Zapier task history for errors
- Verify Gmail authorization is active
- Check spam folders

**Issue**: Wrong investor receiving emails
- Verify email addresses in Investor Registry
- Check filter conditions in Zap

**Issue**: Duplicate emails
- Enable "Skip if row exists" in trigger settings
- Add unique identifier checks

---

**System Version**: 1.0  
**Last Updated**: March 2024  
**Created for**: Crystal Power Investments
