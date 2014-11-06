# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

Company.create(name: "Apple Inc.", symbol: "AAPL")
Company.create(name: "Tesla Motors", symbol: "TSLA")
Company.create(name: "Google", symbol: "GOOG")

User.create(name: "Max", email: "maxplomer@gmail.com", password: "123456")
User.create(name: "helloworld", email: "helloworld", password: "helloworld")


# restart db 
# rake db:drop db:create:all db:migrate db:seed

# save schedule.rb to crontab
# whenever --update-crontab




# some end of the day stock quote because now using ask and change and ask is nil after hours
#can't buy unless ask is not nil
# Quote.create(company_id: 1, price: 106.74, change: 1.63)
# Quote.create(company_id: 2, price: 242.77, change: 21.10)
# Quote.create(company_id: 3, price: 548.90, change: 8.13)


# want to create some sample trades because market is closed and can't trade after hours
# Trade.create(user_id: 1, company_id: 1, num_shares: 100, price: 95.42)
# Trade.create(user_id: 1, company_id: 2, num_shares: -100, price: 295.23)
# Trade.create(user_id: 1, company_id: 3, num_shares: 100, price: 25)
# Trade.create(user_id: 1, company_id: 3, num_shares: -100, price: 25)

# Trade.create(user_id: 2, company_id: 1, num_shares: -100, price: 95.42)
# Trade.create(user_id: 2, company_id: 2, num_shares: 100, price: 295.23)


# need some sample notification_messages
# NotificationMessage.create(
#   user_id: 1, 
#   message: "APPL triggered +4.0% alert"
# )
# NotificationMessage.create(
#   user_id: 1, 
#   message: "GOOG triggered -3.0% alert"
# )

# need to test profit graph, works best during trading day
# user = User.new(name: "sennacy", email: "sennacy@catworld.gov", password: "helloworld")
# user.created_at = Time.now - 2.day
# user.save

# trade = Trade.new(user_id: 3, company_id: 1, num_shares: 100, price: 106.0)
# trade.created_at = Time.now - 2.day + 20.minutes
# trade.save

# quote = Quote.new(company_id: 1, price: 106.0, change: 1.63)
# quote.created_at = Time.now - 2.day + 20.minutes
# quote.save

# quote = Quote.new(company_id: 1, price: 107.32, change: 1.63)
# quote.created_at = Time.now - 1.day + 20.minutes
# quote.save


# need to seed the Company table with the entire s&p 500, (i removed appl and goog, tsla not on sp500)

# symbols = ["MMM", "ABT", "ABBV", "ACN", "ACE", "ACT", "ADBE", "AES", "AET", "AFL", "A", "GAS", "APD", "ARG", "AKAM", "AA", "ALXN", "ATI", "ALLE", "AGN", "ADS", "ALL", "ALTR", "MO", "AMZN", "AEE", "AEP", "AXP", "AIG", "AMT", "AMP", "ABC", "AME", "AMGN", "APH", "APC", "ADI", "AON", "APA", "AIV", "AMAT", "ADM", "AIZ", "T", "ADSK", "ADP", "AN", "AZO", "AVGO", "AVB", "AVY", "AVP", "BHI", "BLL", "BAC", "BCR", "BAX", "BBT", "BDX", "BBBY", "BMS", "BRK-B", "BBY", "BIIB", "BLK", "HRB", "BA", "BWA", "BXP", "BSX", "BMY", "BRCM", "BF-B", "CA", "CVC", "COG", "CAM", "CPB", "COF", "CAH", "CFN", "KMX", "CCL", "CAT", "CBG", "CBS", "CELG", "CNP", "CTL", "CERN", "CF", "CHRW", "CHK", "CVX", "CMG", "CB", "CI", "XEC", "CINF", "CTAS", "CSCO", "C", "CTXS", "CLX", "CME", "CMS", "COH", "KO", "CCE", "CTSH", "CL", "CMCSA", "CMA", "CSC", "CAG", "COP", "CNX", "ED", "STZ", "GLW", "COST", "COV", "CCI", "CSX", "CMI", "CVS", "DHR", "DRI", "DVA", "DE", "DLPH", "DAL", "DNR", "XRAY", "DVN", "DO", "DTV", "DFS", "DISCA", "DG", "DLTR", "D", "DOV", "DOW", "DPS", "DTE", "DUK", "DNB", "ETFC", "DD", "EMN", "ETN", "EBAY", "ECL", "EIX", "EW", "EA", "EMC", "EMR", "ESV", "ETR", "EOG", "EQT", "EFX", "EQR", "ESS", "EL", "EXC", "EXPE", "EXPD", "ESRX", "XOM", "FFIV", "FB", "FDO", "FAST", "FDX", "FIS", "FITB", "FSLR", "FE", "FISV", "FLIR", "FLS", "FLR", "FMC", "FTI", "F", "FRX", "FOSL", "BEN", "FCX", "FTR", "GME", "GCI", "GPS", "GRMN", "GD", "GE", "GGP", "GIS", "GM", "GPC", "GNW", "GILD", "GS", "GT", "GOOGL", "GHC", "GWW", "HAL", "HOG", "HAR", "HRS", "HIG", "HAS", "HCP", "HCN", "HP", "HSY", "HES", "HPQ", "HD", "HON", "HRL", "DHI", "HSP", "HST", "HCBK", "HUM", "HBAN", "ITW", "IR", "TEG", "INTC", "ICE", "IPG", "IBM", "IFF", "IP", "INTU", "ISRG", "IVZ", "IRM", "JBL", "JEC", "JNJ", "JCI", "JOY", "JPM", "JNPR", "KSU", "K", "GMCR", "KEY", "KMB", "KIM", "KMI", "KLAC", "KSS", "KRFT", "KR", "LB", "LLL", "LH", "LRCX", "LM", "LEG", "LEN", "LUK", "LLY", "LNC", "LLTC", "LMT", "L", "LO", "LOW", "LYB", "MTB", "MAC", "M", "MRO", "MPC", "MAR", "MMC", "MAS", "MA", "MAT", "MKC", "MCD", "MHFI", "MCK", "MJN", "MWV", "MDT", "MRK", "MET", "KORS", "MCHP", "MU", "MSFT", "MHK", "TAP", "MDLZ", "MON", "MNST", "MCO", "MS", "MOS", "MSI", "MUR", "MYL", "NBR", "NDAQ", "NOV", "NAVI", "NTAP", "NFLX", "NWL", "NFX", "NEM", "NWSA", "NEE", "NLSN", "NKE", "NI", "NE", "NBL", "JWN", "NSC", "NU", "NTRS", "NOC", "NRG", "NUE", "NVDA", "ORLY", "OXY", "OMC", "OKE", "ORCL", "OI", "PCAR", "PLL", "PH", "PDCO", "PAYX", "BTU", "PNR", "PBCT", "POM", "PEP", "PKI", "PRGO", "PETM", "PFE", "PCG", "PM", "PSX", "PNW", "PXD", "PBI", "PCL", "PNC", "PPG", "PPL", "PX", "PCP", "PFG", "PG", "PGR", "PLD", "PRU", "PEG", "PSA", "PHM", "PVH", "QEP", "QCOM", "PWR", "DGX", "RL", "RRC", "RTN", "RHT", "REGN", "RF", "RSG", "RAI", "RHI", "ROK", "COL", "ROP", "ROST", "RDC", "R", "SWY", "CRM", "SNDK", "SCG", "SLB", "SCHW", "SNI", "STX", "SEE", "SRE", "SHW", "SIAL", "SPG", "SJM", "SNA", "SO", "LUV", "SWN", "SE", "STJ", "SWK", "SPLS", "SBUX", "HOT", "STT", "SRCL", "SYK", "STI", "SYMC", "SYY", "TROW", "TGT", "TEL", "TE", "THC", "TDC", "TSO", "TXN", "TXT", "ADT", "BK", "PCLN", "WMB", "TMO", "TIF", "TWC", "TWX", "TJX", "TMK", "TSS", "TSCO", "RIG", "TRV", "TRIP", "FOXA", "TYC", "TSN", "UA", "UNP", "UPS", "X", "UTX", "UNH", "UNM", "URBN", "USB", "VLO", "VAR", "VTR", "VRSN", "VZ", "VRTX", "VFC", "VIAB", "V", "VNO", "VMC", "WMT", "WAG", "DIS", "WM", "WAT", "WLP", "WFC", "WDC", "WU", "WY", "WHR", "WFM", "WIN", "WEC", "WYN", "WYNN", "XEL", "XRX", "XLNX", "XL", "XYL", "YHOO", "YUM", "ZMH", "ZION", "ZTS"]
# names = ["3M Co.", "Abbott Laboratories", "AbbVie Inc.", "Accenture", "ACE Limited", "Actavis Inc", "Adobe Systems Inc", "AES Corp", "Aetna Inc", "AFLAC Inc", "Agilent Technologies Inc", "AGL Resources Inc.", "Air Products & Chemicals Inc", "Airgas Inc", "Akamai Technologies Inc", "Alcoa Inc", "Alexion Pharmaceuticals", "Allegheny Technologies Inc", "Allegion plc", "Allergan Inc", "Alliance Data Systems Corp", "Allstate Corp", "Altera Corp", "Altria Group Inc", "Amazon.com Inc", "Ameren Corp", "American Electric Power", "American Express Co", "American Intl Group Inc", "American Tower Corp A", "Ameriprise Financial", "AmerisourceBergen Corp", "AMETEK Inc", "Amgen Inc", "Amphenol Corp A", "Anadarko Petroleum Corp", "Analog Devices Inc", "Aon plc", "Apache Corporation", "Apartment Investment & Mgmt", "Applied Materials Inc", "Archer-Daniels-Midland Co", "Assurant Inc", "AT&T Inc", "Autodesk Inc", "Automatic Data Processing", "AutoNation Inc", "AutoZone Inc", "Avago Technologies Ltd", "AvalonBay Communities, Inc.", "Avery Dennison Corp", "Avon Products", "Baker Hughes Inc", "Ball Corp", "Bank of America Corp", "Bard (C.R.) Inc.", "Baxter International Inc.", "BB&T Corporation", "Becton Dickinson", "Bed Bath & Beyond", "Bemis Company", "Berkshire Hathaway", "Best Buy Co. Inc.", "BIOGEN IDEC Inc.", "BlackRock", "Block H&R", "Boeing Company", "BorgWarner", "Boston Properties", "Boston Scientific", "Bristol-Myers Squibb", "Broadcom Corporation", "Brown-Forman Corporation", "CA, Inc.", "Cablevision Systems Corp.", "Cabot Oil & Gas", "Cameron International Corp.", "Campbell Soup", "Capital One Financial", "Cardinal Health Inc.", "Carefusion", "Carmax Inc", "Carnival Corp.", "Caterpillar Inc.", "CBRE Group", "CBS Corp.", "Celgene Corp.", "CenterPoint Energy", "CenturyLink Inc", "Cerner", "CF Industries Holdings Inc", "C. H. Robinson Worldwide", "Chesapeake Energy", "Chevron Corp.", "Chipotle Mexican Grill", "Chubb Corp.", "CIGNA Corp.", "Cimarex Energy Co", "Cincinnati Financial", "Cintas Corporation", "Cisco Systems", "Citigroup Inc.", "Citrix Systems", "Clorox Co.", "CME Group Inc.", "CMS Energy", "Coach Inc.", "Coca Cola Co.", "Coca-Cola Enterprises", "Cognizant Technology Solutions", "Colgate-Palmolive", "Comcast Corp.", "Comerica Inc.", "Computer Sciences Corp.", "ConAgra Foods Inc.", "ConocoPhillips", "CONSOL Energy Inc.", "Consolidated Edison", "Constellation Brands", "Corning Inc.", "Costco Co.", "Covidien plc", "Crown Castle International Corp.", "CSX Corp.", "Cummins Inc.", "CVS Caremark Corp.", "Danaher Corp.", "Darden Restaurants", "DaVita Inc.", "Deere & Co.", "Delphi Automotive PLC", "Delta Air Lines", "Denbury Resources Inc.", "Dentsply International", "Devon Energy Corp.", "Diamond Offshore Drilling", "DirecTV", "Discover Financial Services", "Discovery Communications", "Dollar General Corp", "Dollar Tree", "Dominion Resources", "Dover Corp.", "Dow Chemical", "Dr Pepper Snapple Group", "DTE Energy Co.", "Duke Energy", "Dun & Bradstreet", "E-Trade", "Du Pont (E.I.)", "Eastman Chemical", "Eaton Corp.", "eBay Inc.", "Ecolab Inc.", "Edison Int'l", "Edwards Lifesciences", "Electronic Arts", "EMC Corp.", "Emerson Electric", "Ensco plc", "Entergy Corp.", "EOG Resources", "EQT Corporation", "Equifax Inc.", "Equity Residential", "Essex Property Trust", "Estee Lauder Cos.", "Exelon Corp.", "Expedia Inc.", "Expeditors Int'l", "Express Scripts", "Exxon Mobil Corp.", "F5 Networks", "Facebook Inc", "Family Dollar Stores", "Fastenal Co", "FedEx Corporation", "Fidelity National Information Services", "Fifth Third Bancorp", "First Solar Inc", "FirstEnergy Corp", "Fiserv Inc", "FLIR Systems", "Flowserve Corporation", "Fluor Corp.", "FMC Corporation", "FMC Technologies Inc.", "Ford Motor", "Forest Laboratories", "Fossil, Inc.", "Franklin Resources", "Freeport-McMoran Cp & Gld", "Frontier Communications", "GameStop Corp.", "Gannett Co.", "Gap (The)", "Garmin Ltd", "General Dynamics", "General Electric", "General Growth Properties Inc", "General Mills", "General Motors Company", "Genuine Parts", "Genworth Financial Inc.", "Gilead Sciences", "Goldman Sachs Group", "Goodyear Tire & Rubber", "Google Inc A", "Graham Holdings Co", "Grainger (W.W.) Inc.", "Halliburton Co.", "Harley-Davidson", "Harman Int'l Industries", "Harris Corporation", "Hartford Financial Svc.Gp.", "Hasbro Inc.", "HCP Inc.", "Health Care REIT", "Helmerich & Payne", "The Hershey Company", "Hess Corporation", "Hewlett-Packard", "Home Depot", "Honeywell Int'l Inc.", "Hormel Foods Corp.", "D. R. Horton", "Hospira Inc.", "Host Hotels & Resorts", "Hudson City Bancorp", "Humana Inc.", "Huntington Bancshares", "Illinois Tool Works", "Ingersoll-Rand PLC", "Integrys Energy Group Inc.", "Intel Corp.", "IntercontinentalExchange Inc.", "Interpublic Group", "International Bus. Machines", "International Flav/Frag", "International Paper", "Intuit Inc.", "Intuitive Surgical Inc.", "Invesco Ltd.", "Iron Mountain Incorporated", "Jabil Circuit", "Jacobs Engineering Group", "Johnson & Johnson", "Johnson Controls", "Joy Global Inc.", "JPMorgan Chase & Co.", "Juniper Networks", "Kansas City Southern Inc", "Kellogg Co.", "Keurig Green Mountain Inc", "KeyCorp", "Kimberly-Clark", "Kimco Realty", "Kinder Morgan", "KLA-Tencor Corp.", "Kohl's Corp.", "Kraft Foods Group Inc.", "Kroger Co.", "L Brands Inc", "L-3 Communications Holdings", "Laboratory Corp. of America Holding", "Lam Research", "Legg Mason", "Leggett & Platt", "Lennar Corp.", "Leucadia National Corp.", "Lilly (Eli) & Co.", "Lincoln National", "Linear Technology Corp.", "Lockheed Martin Corp.", "Loews Corp.", "Lorillard Inc.", "Lowe's Cos.", "LyondellBasell Industries N.V.", "M&T Bank Corp.", "Macerich Co", "Macy's Inc.", "Marathon Oil Corp.", "Marathon Petroleum", "Marriott Int'l.", "Marsh & McLennan", "Masco Corp.", "Mastercard Inc.", "Mattel Inc.", "McCormick & Co.", "McDonald's Corp.", "McGraw Hill Financial Inc", "McKesson Corp.", "Mead Johnson", "MeadWestvaco Corporation", "Medtronic Inc.", "Merck & Co.", "MetLife Inc.", "Michael Kors Holdings Ltd", "Microchip Technology", "Micron Technology", "Microsoft Corp.", "Mohawk Industries Inc", "Molson Coors Brewing Company", "Mondelez International Inc", "Monsanto Co.", "Monster Beverage", "Moody's Corp", "Morgan Stanley", "The Mosaic Company", "Motorola Solutions Inc.", "Murphy Oil", "Mylan Inc.", "Nabors Industries Ltd.", "NASDAQ OMX Group", "National Oilwell Varco Inc.", "Navient Corp", "NetApp", "NetFlix Inc.", "Newell Rubbermaid Co.", "Newfield Exploration Co", "Newmont Mining Corp. (Hldg. Co.)", "News Corporation", "NextEra Energy Resources", "Nielsen Holdings NV", "NIKE Inc.", "NiSource Inc.", "Noble Corp", "Noble Energy Inc", "Nordstrom", "Norfolk Southern Corp.", "Northeast Utilities", "Northern Trust Corp.", "Northrop Grumman Corp.", "NRG Energy", "Nucor Corp.", "Nvidia Corporation", "O'Reilly Automotive", "Occidental Petroleum", "Omnicom Group", "ONEOK", "Oracle Corp.", "Owens-Illinois Inc", "PACCAR Inc.", "Pall Corp.", "Parker-Hannifin", "Patterson Companies", "Paychex Inc.", "Peabody Energy", "Pentair Ltd.", "People's United Bank", "Pepco Holdings Inc.", "PepsiCo Inc.", "PerkinElmer", "Perrigo", "PETsMART Inc", "Pfizer Inc.", "PG&E Corp.", "Philip Morris International", "Phillips 66", "Pinnacle West Capital", "Pioneer Natural Resources", "Pitney-Bowes", "Plum Creek Timber Co.", "PNC Financial Services", "PPG Industries", "PPL Corp.", "Praxair Inc.", "Precision Castparts", "Principal Financial Group", "Procter & Gamble", "Progressive Corp.", "ProLogis", "Prudential Financial", "Public Serv. Enterprise Inc.", "Public Storage", "Pulte Homes Inc.", "PVH Corp", "QEP Resources", "QUALCOMM Inc.", "Quanta Services Inc.", "Quest Diagnostics", "Polo Ralph Lauren Corp.", "Range Resources Corp.", "Raytheon Co.", "Red Hat Inc.", "Regeneron Pharmaceuticals Inc", "Regions Financial Corp.", "Republic Services Inc", "Reynolds American Inc.", "Robert Half International", "Rockwell Automation Inc.", "Rockwell Collins", "Roper Industries", "Ross Stores Inc.", "Rowan Cos.", "Ryder System", "Safeway Inc.", "Salesforce.com", "SanDisk Corporation", "SCANA Corp", "Schlumberger Ltd.", "Charles Schwab", "Scripps Networks Interactive Inc.", "Seagate Technology", "Sealed Air Corp.(New)", "Sempra Energy", "Sherwin-Williams", "Sigma-Aldrich", "Simon Property Group Inc", "Smucker (J.M.)", "Snap-On Inc.", "Southern Co.", "Southwest Airlines", "Southwestern Energy", "Spectra Energy Corp.", "St Jude Medical", "Stanley Black & Decker", "Staples Inc.", "Starbucks Corp.", "Starwood Hotels & Resorts", "State Street Corp.", "Stericycle Inc", "Stryker Corp.", "SunTrust Banks", "Symantec Corp.", "Sysco Corp.", "T. Rowe Price Group", "Target Corp.", "TE Connectivity Ltd.", "TECO Energy", "Tenet Healthcare Corp.", "Teradata Corp.", "Tesoro Petroleum Co.", "Texas Instruments", "Textron Inc.", "The ADT Corp.", "The Bank of New York Mellon Corp.", "Priceline.com Inc", "Williams Cos.", "Thermo Fisher Scientific", "Tiffany & Co.", "Time Warner Cable Inc.", "Time Warner Inc.", "TJX Companies Inc.", "Torchmark Corp.", "Total System Services", "Tractor Supply Co", "Transocean Ltd", "The Travelers Companies Inc.", "TripAdvisor", "Twenty-First Century Fox, Inc", "Tyco International", "Tyson Foods", "Under Armour Inc A", "Union Pacific", "United Parcel Service", "United States Steel Corp.", "United Technologies", "United Health Group Inc.", "Unum Group", "Urban Outfitters", "U.S. Bancorp", "Valero Energy", "Varian Medical Systems", "Ventas Inc", "Verisign Inc.", "Verizon Communications", "Vertex Pharmaceuticals Inc", "V.F. Corp.", "Viacom Inc.", "Visa Inc.", "Vornado Realty Trust", "Vulcan Materials", "Wal-Mart Stores", "Walgreen Co.", "Walt Disney Co.", "Waste Management Inc.", "Waters Corporation", "WellPoint Inc.", "Wells Fargo", "Western Digital", "Western Union Co", "Weyerhaeuser Corp.", "Whirlpool Corp.", "Whole Foods Market", "Windstream Corporation", "Wisconsin Energy Corporation", "Wyndham Worldwide", "Wynn Resorts Ltd", "Xcel Energy Inc", "Xerox Corp.", "Xilinx Inc", "XL Capital", "Xylem Inc.", "Yahoo Inc.", "Yum! Brands Inc", "Zimmer Holdings", "Zions Bancorp", "Zoetis Inc"]
# 0.upto(symbols.length - 1) { |i| Company.create(name: names[i], symbol: symbols[i]) }

#### will need initial quotes for all the new companies


# companies = Company.all;

# companies.each do |company|
#   company_id = company.id

#   price = MarketBeat.last_trade_real_time(company.symbol)
#   change = MarketBeat.change_real_time(company.symbol)
#   unless price.nil?
#     Quote.create(company_id: company_id, price: price, change: change)
#   end
# end

##### NWL does not return a quote!!!!!



















