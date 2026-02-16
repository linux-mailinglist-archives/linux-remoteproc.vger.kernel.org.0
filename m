Return-Path: <linux-remoteproc+bounces-6480-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from mail.lfdr.de
	by lfdr with LMTP
	id oNrVBDJkk2k44QEAu9opvQ
	(envelope-from <linux-remoteproc+bounces-6480-lists+linux-remoteproc=lfdr.de@vger.kernel.org>)
	for <lists+linux-remoteproc@lfdr.de>; Mon, 16 Feb 2026 19:38:42 +0100
X-Original-To: lists+linux-remoteproc@lfdr.de
Received: from tor.lore.kernel.org (tor.lore.kernel.org [172.105.105.114])
	by mail.lfdr.de (Postfix) with ESMTPS id 7AC25147014
	for <lists+linux-remoteproc@lfdr.de>; Mon, 16 Feb 2026 19:38:41 +0100 (CET)
Received: from smtp.subspace.kernel.org (conduit.subspace.kernel.org [100.90.174.1])
	by tor.lore.kernel.org (Postfix) with ESMTP id 407A5301F179
	for <lists+linux-remoteproc@lfdr.de>; Mon, 16 Feb 2026 18:38:40 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4D22E242D6A;
	Mon, 16 Feb 2026 18:38:38 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b="N+UsvUqb"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from BYAPR05CU005.outbound.protection.outlook.com (mail-westusazon11010026.outbound.protection.outlook.com [52.101.85.26])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E5CFA1C69D;
	Mon, 16 Feb 2026 18:38:36 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=fail smtp.client-ip=52.101.85.26
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1771267118; cv=fail; b=tIrBjSFYGekGZssMyNF19LAYCF0glT4G7t7rWYgWDAbwnHBjgMfbBhssdYPfYcyWu+lwXgIUBoXoAl6PZriyFlaDX9iTva6xSyga383fDjNcmWilQpGlSANlZ8VXueeh+QKJwnXXD4OPCEdp1OSsdnEg1YPF4ykjCtYt11rLkOA=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1771267118; c=relaxed/simple;
	bh=OopUMdRRhAty1BWNufrNVNYlymhYiSKUwFLjWCYhtIM=;
	h=Message-ID:Date:MIME-Version:Subject:To:CC:References:From:
	 In-Reply-To:Content-Type; b=EL1G6YNPJON+otMbVFn3ZK8YFlq/EHEkqAx7Z3IZbOZZVaeFbphCaWttwrk0LpOXLHjfVikfwG3NkatxeG0pQAlLKW7/ICWvbijwY9jaZQ0lq8dd5Xwcy1s9i7hhz0AbXUx/TwwbCTLn02GuNWHH+I+H11InAu4wKZ6khVeNyBo=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com; spf=fail smtp.mailfrom=amd.com; dkim=pass (1024-bit key) header.d=amd.com header.i=@amd.com header.b=N+UsvUqb; arc=fail smtp.client-ip=52.101.85.26
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=amd.com
Authentication-Results: smtp.subspace.kernel.org; spf=fail smtp.mailfrom=amd.com
ARC-Seal: i=1; a=rsa-sha256; s=arcselector10001; d=microsoft.com; cv=none;
 b=ynpZwRAhgjhIGnqRuMMVp2kG5ZWPJV9KGdcXTsYI6YdKU8vYIiPM3Tm231EE3y/Jh8e1LU2tqoaLqfQnT+cG5rPWieQAmE5+UTbV8myn5hqetrSjVeXPTObc4JuBlC80Fcxc7AwVQkwQCemaZRO8016qGDGS8Pmxh7C3TONpQZKJk/Q5kg3aOuY6VHmXMJN4N9cYWSJ5/2b23QQP498172NYqqtvBW899EJ6rnqBaXuq4rhexi5c3cUDqyW/2Iq7FHWPQ0rw3992qZFKpLGODm+ZQE2QiXuQCCl1WrkLs38qPuK4b2YS7b2Zqp2ts/0uGpwYz/3BQ28LKtpoLfK8qA==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=microsoft.com;
 s=arcselector10001;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-AntiSpam-MessageData-ChunkCount:X-MS-Exchange-AntiSpam-MessageData-0:X-MS-Exchange-AntiSpam-MessageData-1;
 bh=uVc+tXQa5l/IqOLml0NDSKQJdAHAqcvljIFkd8lKrVk=;
 b=WoI4KBzVW62wBYAQKOpKTmcNZsTYC0vdNOB7ft8ETIgD1xR4lWMU/qaMasgf05tNhEe5T5BZxsC2DoPSjc/RwM4JbZloWz6sjAF6s9t++yeeLWMknGYvrKKEWQUTGHI6mpv+FM8F5x3m03nmpiudNeEnfNNsgdQk45FOYgPmeR0FsZYqwoyECAg5C06Ccs4Z0yLCb+jBHD75JVnJSGF9ruB0PV9Xf10ZMuUlpxa3dkdyG8ge43F7icV/nk86kwGdOKf61DuMAhVHSjBJq8kY4V5mGVwEfEBg0OJ/+ebEllD0vdr8ENlkT/Gz42Qmy2lu/QfamedRzrD49VQQWQWZkg==
ARC-Authentication-Results: i=1; mx.microsoft.com 1; spf=pass (sender ip is
 165.204.84.17) smtp.rcpttodomain=gmail.com smtp.mailfrom=amd.com; dmarc=pass
 (p=quarantine sp=quarantine pct=100) action=none header.from=amd.com;
 dkim=none (message not signed); arc=none (0)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=amd.com; s=selector1;
 h=From:Date:Subject:Message-ID:Content-Type:MIME-Version:X-MS-Exchange-SenderADCheck;
 bh=uVc+tXQa5l/IqOLml0NDSKQJdAHAqcvljIFkd8lKrVk=;
 b=N+UsvUqbAkWc4mMMSG0ZNvtXI0fBV6IzBIYVZHd/L7WZgox/FF3wI26lsv2bm0Gl/VjSakhsb8TeZ8PwJCDXt12btQMUrRy/i+ZJZUGgj1R6c1VXS+G/W4yy7gnxNmvYwWe3aHyQSqmbaCzmof/btGGCMPbytjKRisHKMWBX7g8=
Received: from BY1P220CA0020.NAMP220.PROD.OUTLOOK.COM (2603:10b6:a03:5c3::7)
 by PH7PR12MB5807.namprd12.prod.outlook.com (2603:10b6:510:1d3::8) with
 Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.20.9611.16; Mon, 16 Feb
 2026 18:38:26 +0000
Received: from SJ1PEPF000023DA.namprd21.prod.outlook.com
 (2603:10b6:a03:5c3:cafe::31) by BY1P220CA0020.outlook.office365.com
 (2603:10b6:a03:5c3::7) with Microsoft SMTP Server (version=TLS1_3,
 cipher=TLS_AES_256_GCM_SHA384) id 15.20.9611.16 via Frontend Transport; Mon,
 16 Feb 2026 18:38:30 +0000
X-MS-Exchange-Authentication-Results: spf=pass (sender IP is 165.204.84.17)
 smtp.mailfrom=amd.com; dkim=none (message not signed)
 header.d=none;dmarc=pass action=none header.from=amd.com;
Received-SPF: Pass (protection.outlook.com: domain of amd.com designates
 165.204.84.17 as permitted sender) receiver=protection.outlook.com;
 client-ip=165.204.84.17; helo=satlexmb07.amd.com; pr=C
Received: from satlexmb07.amd.com (165.204.84.17) by
 SJ1PEPF000023DA.mail.protection.outlook.com (10.167.244.75) with Microsoft
 SMTP Server (version=TLS1_2, cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id
 15.20.9654.0 via Frontend Transport; Mon, 16 Feb 2026 18:38:26 +0000
Received: from satlexmb08.amd.com (10.181.42.217) by satlexmb07.amd.com
 (10.181.42.216) with Microsoft SMTP Server (version=TLS1_2,
 cipher=TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384) id 15.2.2562.17; Mon, 16 Feb
 2026 12:38:25 -0600
Received: from [10.31.198.208] (10.180.168.240) by satlexmb08.amd.com
 (10.181.42.217) with Microsoft SMTP Server id 15.2.2562.17 via Frontend
 Transport; Mon, 16 Feb 2026 12:38:25 -0600
Message-ID: <ab211e6f-466e-4bc6-bdb2-660518dc9b77@amd.com>
Date: Mon, 16 Feb 2026 12:38:25 -0600
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Reply-To: <tanmay.shah@amd.com>
Subject: Re: [PATCH] mailbox: add API to query available TX queue slots
To: <jassisinghbrar@gmail.com>, <linux-kernel@vger.kernel.org>,
	<linux-remoteproc@vger.kernel.org>
CC: <tanmay.shah@amd.com>, <andersson@kernel.org>,
	<mathieu.poirier@linaro.org>
References: <20260209234430.512492-1-jassisinghbrar@gmail.com>
Content-Language: en-US
From: "Shah, Tanmay" <tanmays@amd.com>
In-Reply-To: <20260209234430.512492-1-jassisinghbrar@gmail.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: 7bit
X-EOPAttributedMessage: 0
X-MS-PublicTrafficType: Email
X-MS-TrafficTypeDiagnostic: SJ1PEPF000023DA:EE_|PH7PR12MB5807:EE_
X-MS-Office365-Filtering-Correlation-Id: 8daac525-5988-41e6-39fc-08de6d8a9264
X-MS-Exchange-SenderADCheck: 1
X-MS-Exchange-AntiSpam-Relay: 0
X-Microsoft-Antispam:
	BCL:0;ARA:13230040|82310400026|1800799024|376014|36860700013|7053199007;
X-Microsoft-Antispam-Message-Info:
	=?utf-8?B?UzQvU0ZydzlHWSs0S0hUV0tMa085ak1lZkVyTnNPYW5iSHNhZmJCUEhpUHZm?=
 =?utf-8?B?enFqMmhYNWs0bERFRXNzcGZ0cTFYbXBaYW8wS3F3OXc2Y25wVzdZbzBxek9n?=
 =?utf-8?B?Q20rSWlhQzk4VUFLK1RmZlYrRnJybTRMOWdnZUd2N1Z1WTBUMStGUmZqN0JX?=
 =?utf-8?B?aitDZlVXL01JRlBnVytCdHN3MG5GcEFlYVJmNlZYL2hMOTZBd2hJbS9DbTBz?=
 =?utf-8?B?OTFuclBNbVBMUjBJbFVnbnhORlVyOHVYNkI1ZFNpVC9rRExUUmgyREJZeGxV?=
 =?utf-8?B?OU1sTXdxWktGL1Q2WG9wOVNzQXJ3YUxrZDVIUFhLTlNzRVVmSWJEMGgwQThS?=
 =?utf-8?B?NkNiUkVValRDdTBPRFFqenBUaTV0dHFPbGVwMGMrZGs2TFhTaU50ZjR6anJk?=
 =?utf-8?B?dXhsVlk4cXRIRTVDdDFSTytLQ1lmank2eVBJeXJFS2xyT1ZuRjBDMXhQL0tF?=
 =?utf-8?B?ZHFRMzFWYVlnOXlQVHZXZGZjRUxPQmNtcEZsN2NnMkF0bm00ZVhzbnlVUlJv?=
 =?utf-8?B?NWNNN0UyQWhsSjAwY2xaSVFaL3J4cUVHZkJYSklBd3Uzd01HemFSVTdoSXI2?=
 =?utf-8?B?TUgxdGNoN013ZVppbTRLS2pURXphYko0c2QrbGJTUlkvemFkMGZGN0FXUjNm?=
 =?utf-8?B?TGtDWkN2TWU4SFczU2FMUXRLZnEzbUJkRFpkSUExckdTR2pyYzN5ZHJ3Q1g3?=
 =?utf-8?B?ZkRGRkhlOEFBRERLL2pheExMUFFaSW1XY2d1dDk3L3ZuT3M4U3N3MFcwdXVG?=
 =?utf-8?B?K2t0Q3hDVFRqTUx6RTNCQkdhOHlHdmgvalRxeE0yU2ErT3hGKzNydjhvRWdi?=
 =?utf-8?B?SFZ1WXA2N0NhaEk4VERTbGdHRlhIcDVLVmNENWVPY094QWU5cUtBK2Y4Z0w1?=
 =?utf-8?B?N3JHQVQzUmUzaVFNczBUNmc3eitkUnBUaUNLTnMwV1ZVRXZiZ2xnYWpVYWNY?=
 =?utf-8?B?QUZVYm1LRkJMOXUzVm5sWGljeWQxV2tFQmlidi9QamkxZDFxbmpZckZYRCtT?=
 =?utf-8?B?eXRjUWJUNSs3SE96UU9Zd1ZWRFgyTGhyU3hvZjlxdDhTMFRPUDRVcjFsRHJI?=
 =?utf-8?B?eDdtM01MNVQxd0ZlZjNhblhmK3c2alpYSEM3aXpsMWMySU1WNG01RitJbVEw?=
 =?utf-8?B?ZDQxT0NmUk1tMGxMSlg5Q2dDM0lOb1U3cUtiTlltNlpZNlk5cFl3enpaSCsw?=
 =?utf-8?B?dlFKSXFZTXhTVXpVZWNOdUdwcTJHbW9hT3VqWlNlTkJoeU1LVVVDdk9lMFQy?=
 =?utf-8?B?K21kcW55M1BqQWVnSnp0a2dRbGorY21IcnhFaTBTOGNmVE1Vc0t0ays1Uk5F?=
 =?utf-8?B?eHFZQW9tenNweUx1eVU2UFovaG1jWFR2UFBJeHlTZ1JZNHI3VUR2VWFzcEZQ?=
 =?utf-8?B?ZVk5MERlZWZZVzg3RVZteGxRaFVjSjg1M0hTK2pCWDg2T3B0dHNYUGdKcFFh?=
 =?utf-8?B?N2RJbzExd3IzeWFTdHhVVWhCR08xRkU4RFJYMFM1MFRzK2tCanU5akwxbVl0?=
 =?utf-8?B?U3NqR3hmampYa09BaElsckpPeC9aek9JNFJlUEQ5ZThZRWlpdWx6V2M2b0FO?=
 =?utf-8?B?QWRReldWWVdkdU96aGlVazd4WjhaMDUvUEZVRFlDekdnKzJqVGw3SmZ6a2sx?=
 =?utf-8?B?aHZRTUZrNzM4Y1RmRWMyYm8xYkMreG5aZmV6UkNyOFM1WlZYTk9Ubkl6TWg1?=
 =?utf-8?B?QWVVOWdkM2QwVUIxMWdCYVNpeVBHZXM0aEVnc242QmgyY3Rzb0JoVzFRdDZx?=
 =?utf-8?B?Zkppc2liUHJjcThSM0Q1OWpyQkJhdEJrcTFuU0dJWDJhMndVTERJRVpmRzJo?=
 =?utf-8?B?OFZ4S1ZhM0xLNVpSeVNWZnJLODh2Y2FOUGMzaDZDcHZ5MERqK0ZONENmY1F1?=
 =?utf-8?B?cjBvYVc3RTdqODZMN29ScjQvTTgzeGRyTllKVWZVWHFKRG1qTE4wTTRuNFIr?=
 =?utf-8?B?VXgxcG1iN2Y0VEkveTBjbkUwSGRrOEM0akY1ZCtCWUxPcUJqb2N2Wlo1eURs?=
 =?utf-8?B?eHRHS1pFYkd2WkQ0NnJQOFJvS3k1MUtxY0lSemVuc1JWSU9zNWg3Z09tWUVP?=
 =?utf-8?B?bjF4a1dCWVhlWU44S1FyOEZkL3ZOdFZaTEVlWm9hejQxamtSSmlGUlBKN2hj?=
 =?utf-8?B?b3lQbmorQWJDK0hwYjMzWlFjeTdKemNVRkhVdWRBYS9vM1FKK0wzYTMya2hC?=
 =?utf-8?B?T1hveEpzOUtSdDR0bEJJd09ibUVXRDBLMnFWUFJTK295OGFUWXdiN3ZWRThK?=
 =?utf-8?B?c1VHbjBnejhZT2l3NWpKU1U2dkZnPT0=?=
X-Forefront-Antispam-Report:
	CIP:165.204.84.17;CTRY:US;LANG:en;SCL:1;SRV:;IPV:NLI;SFV:NSPM;H:satlexmb07.amd.com;PTR:InfoDomainNonexistent;CAT:NONE;SFS:(13230040)(82310400026)(1800799024)(376014)(36860700013)(7053199007);DIR:OUT;SFP:1101;
X-MS-Exchange-AntiSpam-MessageData-ChunkCount: 1
X-MS-Exchange-AntiSpam-MessageData-0:
	wv7upStA4V2BC3H7/WZRJ5wAcPfvvLgJ5ImMXmCA7LJIgsP7qW5ivw0zbn8H8syLGtQl7E26EwgP7PR65evvKj9QkbxkehMHJ4jqdfZU1YiFMJUt391RchJcmCDhn3PYgAOxJvsi5bZkFtgXf3LT5yS5z2eVj9R3dG53U7AY0wwXXrFVpeXkHnLqXtkc8mh5Uxa6y3SXJkYCaIGZ2bV5xskS+Ytx/dAGGpw8KzMNPIXGE2plbxqBH94PTLhGJRgiPGcs1f4M5kqTx26l0gAEFT2olatrUfW3YRUB++bJHwUsjlwrkOiaVdBgrMs63nwLjRJmJUqdGa0vPodhiFxZvGeL5Tbv6WdS+0c3OBKfAOUUEJhq1j+fmK3QYlFxvH1JkD5h8VqaFw9EC3AiAggYzt40PNVfvEussHZAIv4k/AYLVNOLXDEsRVWWFb7nraGo
X-OriginatorOrg: amd.com
X-MS-Exchange-CrossTenant-OriginalArrivalTime: 16 Feb 2026 18:38:26.1023
 (UTC)
X-MS-Exchange-CrossTenant-Network-Message-Id: 8daac525-5988-41e6-39fc-08de6d8a9264
X-MS-Exchange-CrossTenant-Id: 3dd8961f-e488-4e60-8e11-a82d994e183d
X-MS-Exchange-CrossTenant-OriginalAttributedTenantConnectingIp: TenantId=3dd8961f-e488-4e60-8e11-a82d994e183d;Ip=[165.204.84.17];Helo=[satlexmb07.amd.com]
X-MS-Exchange-CrossTenant-AuthSource:
	SJ1PEPF000023DA.namprd21.prod.outlook.com
X-MS-Exchange-CrossTenant-AuthAs: Anonymous
X-MS-Exchange-CrossTenant-FromEntityHeader: HybridOnPrem
X-MS-Exchange-Transport-CrossTenantHeadersStamped: PH7PR12MB5807
X-Rspamd-Server: lfdr
X-Spamd-Result: default: False [-0.16 / 15.00];
	ARC_REJECT(1.00)[cv is fail on i=2];
	DMARC_POLICY_ALLOW(-0.50)[amd.com,quarantine];
	R_DKIM_ALLOW(-0.20)[amd.com:s=selector1];
	R_SPF_ALLOW(-0.20)[+ip4:172.105.105.114:c];
	MAILLIST(-0.15)[generic];
	MIME_GOOD(-0.10)[text/plain];
	HAS_LIST_UNSUB(-0.01)[];
	DBL_BLOCKED_OPENRESOLVER(0.00)[tor.lore.kernel.org:helo,tor.lore.kernel.org:rdns];
	TAGGED_FROM(0.00)[bounces-6480-lists,linux-remoteproc=lfdr.de];
	RCVD_TLS_LAST(0.00)[];
	MIME_TRACE(0.00)[0:+];
	DKIM_TRACE(0.00)[amd.com:+];
	FORGED_SENDER_MAILLIST(0.00)[];
	FREEMAIL_TO(0.00)[gmail.com,vger.kernel.org];
	REPLYTO_DOM_NEQ_TO_DOM(0.00)[];
	ASN(0.00)[asn:63949, ipnet:172.105.96.0/20, country:SG];
	RCPT_COUNT_FIVE(0.00)[6];
	PRECEDENCE_BULK(0.00)[];
	FROM_NEQ_ENVFROM(0.00)[tanmays@amd.com,linux-remoteproc@vger.kernel.org];
	FROM_HAS_DN(0.00)[];
	FORGED_RECIPIENTS_MAILLIST(0.00)[];
	HAS_REPLYTO(0.00)[tanmay.shah@amd.com];
	TO_DN_NONE(0.00)[];
	REPLYTO_DOM_EQ_FROM_DOM(0.00)[];
	TAGGED_RCPT(0.00)[linux-remoteproc];
	MID_RHS_MATCH_FROM(0.00)[];
	RCVD_COUNT_SEVEN(0.00)[8]
X-Rspamd-Queue-Id: 7AC25147014
X-Rspamd-Action: no action

Tested-by: Tanmay Shah <tanmay.shah@amd.com>

On 2/9/2026 5:44 PM, jassisinghbrar@gmail.com wrote:
> From: Jassi Brar <jassisinghbrar@gmail.com>
> 
> Clients sometimes need to know whether the mailbox TX queue has room
> before posting a new message. Rather than exposing internal queue state
> through a struct field, provide a proper accessor function that returns
> the number of available slots for a given channel.
> 
> This lets clients choose to back off when the queue is full instead of
> hitting the -ENOBUFS error path and the misleading "Try increasing
> MBOX_TX_QUEUE_LEN" warning.
> 
> Signed-off-by: Jassi Brar <jassisinghbrar@gmail.com>
> ---
>  drivers/mailbox/mailbox.c      | 23 +++++++++++++++++++++++
>  include/linux/mailbox_client.h |  1 +
>  2 files changed, 24 insertions(+)
> 
> diff --git a/drivers/mailbox/mailbox.c b/drivers/mailbox/mailbox.c
> index 2acc6ec229a4..22eb8f3213be 100644
> --- a/drivers/mailbox/mailbox.c
> +++ b/drivers/mailbox/mailbox.c
> @@ -218,6 +218,29 @@ bool mbox_client_peek_data(struct mbox_chan *chan)
>  }
>  EXPORT_SYMBOL_GPL(mbox_client_peek_data);
>  
> +/**
> + * mbox_chan_tx_slots_available - Query the number of available TX queue slots.
> + * @chan: Mailbox channel to query.
> + *
> + * Clients may call this to check how many messages can be queued via
> + * mbox_send_message() before the channel's TX queue is full. This helps
> + * clients avoid the -ENOBUFS error without needing to increase
> + * MBOX_TX_QUEUE_LEN.
> + * This can be called from atomic context.
> + *
> + * Return: Number of available slots in the channel's TX queue.
> + */
> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan)
> +{
> +	unsigned int ret;
> +
> +	guard(spinlock_irqsave)(&chan->lock);
> +	ret = MBOX_TX_QUEUE_LEN - chan->msg_count;
> +
> +	return ret;
> +}
> +EXPORT_SYMBOL_GPL(mbox_chan_tx_slots_available);
> +
>  /**
>   * mbox_send_message -	For client to submit a message to be
>   *				sent to the remote.
> diff --git a/include/linux/mailbox_client.h b/include/linux/mailbox_client.h
> index c6eea9afb943..e5997120f45c 100644
> --- a/include/linux/mailbox_client.h
> +++ b/include/linux/mailbox_client.h
> @@ -45,6 +45,7 @@ int mbox_send_message(struct mbox_chan *chan, void *mssg);
>  int mbox_flush(struct mbox_chan *chan, unsigned long timeout);
>  void mbox_client_txdone(struct mbox_chan *chan, int r); /* atomic */
>  bool mbox_client_peek_data(struct mbox_chan *chan); /* atomic */
> +unsigned int mbox_chan_tx_slots_available(struct mbox_chan *chan); /* atomic */
>  void mbox_free_channel(struct mbox_chan *chan); /* may sleep */
>  
>  #endif /* __MAILBOX_CLIENT_H */


