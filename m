Return-Path: <linux-remoteproc+bounces-3905-lists+linux-remoteproc=lfdr.de@vger.kernel.org>
X-Original-To: lists+linux-remoteproc@lfdr.de
Delivered-To: lists+linux-remoteproc@lfdr.de
Received: from sv.mirrors.kernel.org (sv.mirrors.kernel.org [IPv6:2604:1380:45e3:2400::1])
	by mail.lfdr.de (Postfix) with ESMTPS id 4A4C6ACFB91
	for <lists+linux-remoteproc@lfdr.de>; Fri,  6 Jun 2025 05:18:57 +0200 (CEST)
Received: from smtp.subspace.kernel.org (relay.kernel.org [52.25.139.140])
	(using TLSv1.2 with cipher ECDHE-ECDSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by sv.mirrors.kernel.org (Postfix) with ESMTPS id 9F5A63ADABF
	for <lists+linux-remoteproc@lfdr.de>; Fri,  6 Jun 2025 03:18:34 +0000 (UTC)
Received: from localhost.localdomain (localhost.localdomain [127.0.0.1])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 4ED5919F419;
	Fri,  6 Jun 2025 03:18:53 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b="GLK+HJHh"
X-Original-To: linux-remoteproc@vger.kernel.org
Received: from mx0b-0031df01.pphosted.com (mx0b-0031df01.pphosted.com [205.220.180.131])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8B5CF27702
	for <linux-remoteproc@vger.kernel.org>; Fri,  6 Jun 2025 03:18:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=205.220.180.131
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1749179933; cv=none; b=IOZI9TuTOlhR5zad0YUwG7RQNRCK/bW9j8hB+EsnLEnZ0Q6swD63gWhfHQIUTKcdjIr3bkC42i28F8exWuqN9UjGUDP4hut/AcTxbIZ1cs+CQzjrOB0Xt6LVZbqHpJJpFOiAAxs3jgSjp6rNJHVH6s5PRZhw8NwOZrKicjQzhPE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1749179933; c=relaxed/simple;
	bh=2i5oAtsOhCfuVkh3RFLLkb69laqFzI3eanFQVkoVsE4=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=KzrjrHFkEuPwWOtjrA7dXIO5Z/PQnjgCRYFgg/1mlDQsIjnO2O+rtJZsbAiBWGQij1NQ/8cjAz2arfmkbUwmHaqEKbW8xvu039a51PJLLSkZFM43atO7k4E+8nCF11Vq/VLGK+KZmuVtvQBXGKu8KfEf5b35QAGOfxxNetLiEuM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com; spf=pass smtp.mailfrom=oss.qualcomm.com; dkim=pass (2048-bit key) header.d=qualcomm.com header.i=@qualcomm.com header.b=GLK+HJHh; arc=none smtp.client-ip=205.220.180.131
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=oss.qualcomm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=oss.qualcomm.com
Received: from pps.filterd (m0279870.ppops.net [127.0.0.1])
	by mx0a-0031df01.pphosted.com (8.18.1.2/8.18.1.2) with ESMTP id 555FgEBl032469
	for <linux-remoteproc@vger.kernel.org>; Fri, 6 Jun 2025 03:18:50 GMT
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=qualcomm.com; h=
	cc:content-type:date:from:in-reply-to:message-id:mime-version
	:references:subject:to; s=qcppdkim1; bh=3++GTe67hezLZxTd923ZZK6/
	2HCYgNl/NqmTLv8mn6g=; b=GLK+HJHhTMjunX+8wZrkV1MHVFeOYyzomtY3fzTc
	YfBbj3zcxQdBiwlYO5lUA/fdID7nv1x9tsBDSySDmgKfPJAUbsW9rnCaGhadcKFm
	yGriMz10lMh66ygUlLQBhbDVK17ObIzL7/1JPgHoqnqUwizzQRiQzzWQPpFeO76W
	8iopsW9+hlXG6dqxZUU5ydUcDZJFXZH+4/W7g5LiCbnwQLt9C3bo/+zrXsuV2CH7
	Y8YE+Ixf4O9KJzfxs15piC5urKt9d8BrBep79bv6u9iDBxbx//2BzvyBl+LFf65r
	4hfdUZLgWR4aQyDErKIPp4FhAdl4QMUfUtmvvcI08j/I2A==
Received: from mail-qk1-f199.google.com (mail-qk1-f199.google.com [209.85.222.199])
	by mx0a-0031df01.pphosted.com (PPS) with ESMTPS id 471sfv27a2-1
	(version=TLSv1.2 cipher=ECDHE-RSA-AES128-GCM-SHA256 bits=128 verify=NOT)
	for <linux-remoteproc@vger.kernel.org>; Fri, 06 Jun 2025 03:18:49 +0000 (GMT)
Received: by mail-qk1-f199.google.com with SMTP id af79cd13be357-7ceb5b5140eso293864685a.2
        for <linux-remoteproc@vger.kernel.org>; Thu, 05 Jun 2025 20:18:49 -0700 (PDT)
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1749179929; x=1749784729;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=3++GTe67hezLZxTd923ZZK6/2HCYgNl/NqmTLv8mn6g=;
        b=oxcHdrNfZeCwI9EKLfzQHs0Se7w8a0b9ybK8dAbfiOJwzUcMsSsBlxcVXccVj/ob6D
         pbL+mbbtzgbXY3FAtlC7h2qzoCTNj8jEOubRIwpWVOepzDTyrTiS2Jb7Ee5/7p3lQtuL
         7vDMiSQeVQQgZeBZwSUGPjuoin90tDEnGLJDoPTEY+dyXLDy7TePPAjpv26R8p8PvOXu
         gc3W8DH37t3RdBC8rgJ+sAv2b0K96OAfWl1u5DphwWCBi39qOTCzg6hfGGSr6edKK4tZ
         442e+PH8ugnwAvRB6559QB1uZcB3BSRk8RLe1EjJ5d0AbViUrEWlbBURCz0H6Azlalz5
         /4Zw==
X-Forwarded-Encrypted: i=1; AJvYcCWfFbKkFFBrJjWmor3hPPVC+hOOvG7kvAIOV+Q9qMVaaa7qWhP5twEYkjYL2RWH7s6MNrMG+IKtq0S5eUYPdyz5@vger.kernel.org
X-Gm-Message-State: AOJu0YwR8V182WBI6uPPtQ4VyUXBQ8u2zdHmhXZ2izMLZTLlE966lwZG
	v6XNFj08Ai6cEutDF2AGbbZsGd4899p6JEsjO5cJsByL6d7D7IbJOaRGcf53nTy+2MP9jdMALfp
	D/bDvJTI7WhqrIhAz30/sjWv5YPnt0g5V5uW/FiZrunGHvL5rsgmQW2GswBkTYU9PrrGpHKeW
X-Gm-Gg: ASbGncsTBRDDkp7yTsHcf3fb8DAdO4gdNFE1+a08yvkpmfvOlAcTm59NzQT5TqhiM/O
	UbMkTyjzyctzb/dJsTw+GEaBhIjt1nrttR10IYkJh8csC+5FZCE5bUeJUGdg5XzzDVpguFkUbf5
	r02oin88twuQcTglsk8IYuQCS5jlwwiqdvSleMkwXbEFHOmJSaf6j7wPdPPvf2QW+yYHGzlLYtO
	OY+FBm9dspDHMYa+MGMz4rVUM9G0GKMGVfSMCihgL0oRFJNfowQX4AgJupHKZdOgdyQp8OO//ib
	NhcP/1MZj5UlCQ4sy9JRU6FEDGIdJhmz9peEUd39fvqdFvgdit+wEyOf0owtR9uLqF8clbC4YHI
	=
X-Received: by 2002:a05:620a:4626:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d2298e0a5fmr274081585a.58.1749179929193;
        Thu, 05 Jun 2025 20:18:49 -0700 (PDT)
X-Google-Smtp-Source: AGHT+IF8Io/sF3Ee5QrYXTVtaN735LCcylkmkYl4+zwncKIv8c1TCaxXx167NJ16erArYsEsd/Wl+A==
X-Received: by 2002:a05:620a:4626:b0:7c3:cd78:df43 with SMTP id af79cd13be357-7d2298e0a5fmr274079985a.58.1749179928795;
        Thu, 05 Jun 2025 20:18:48 -0700 (PDT)
Received: from eriador.lumag.spb.ru (2001-14ba-a0c3-3a00--7a1.rev.dnainternet.fi. [2001:14ba:a0c3:3a00::7a1])
        by smtp.gmail.com with ESMTPSA id 2adb3069b0e04-5536772ac21sm74495e87.182.2025.06.05.20.18.45
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 05 Jun 2025 20:18:46 -0700 (PDT)
Date: Fri, 6 Jun 2025 06:18:43 +0300
From: Dmitry Baryshkov <dmitry.baryshkov@oss.qualcomm.com>
To: Bjorn Andersson <andersson@kernel.org>
Cc: Dmitry Baryshkov <dmitry.baryshkov@foundries.io>,
        Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>,
        Konrad Dybcio <konradybcio@kernel.org>, linux-arm-msm@vger.kernel.org,
        linux-kernel@vger.kernel.org, linux-remoteproc@vger.kernel.org,
        Mukesh Ojha <mukesh.ojha@oss.qualcomm.com>,
        Doug Anderson <dianders@chromium.org>, stable@vger.kernel.org
Subject: Re: [PATCH 1/3] soc: qcom: mdt_loader: Ensure we don't read past the
 ELF header
Message-ID: <qnqbc4n2ijjtfim77b32xlz7iz2durauv4h5p5h37gmxfpk3gm@5ijes7mg3ahr>
References: <20250605-mdt-loader-validation-and-fixes-v1-0-29e22e7a82f4@oss.qualcomm.com>
 <20250605-mdt-loader-validation-and-fixes-v1-1-29e22e7a82f4@oss.qualcomm.com>
 <bsnn6xpkubifuwxz4kccvves3ifq4ocp53qmbobv6ilmnfuh7x@eejawp7thorm>
 <4ruhapzeti5hiufdkws27w2q3h4psfcpmcfsqrhsnyr2u4sktp@5itmiqxydwrj>
Precedence: bulk
X-Mailing-List: linux-remoteproc@vger.kernel.org
List-Id: <linux-remoteproc.vger.kernel.org>
List-Subscribe: <mailto:linux-remoteproc+subscribe@vger.kernel.org>
List-Unsubscribe: <mailto:linux-remoteproc+unsubscribe@vger.kernel.org>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <4ruhapzeti5hiufdkws27w2q3h4psfcpmcfsqrhsnyr2u4sktp@5itmiqxydwrj>
X-Authority-Analysis: v=2.4 cv=CY8I5Krl c=1 sm=1 tr=0 ts=68425e19 cx=c_pps
 a=HLyN3IcIa5EE8TELMZ618Q==:117 a=xqWC_Br6kY4A:10 a=kj9zAlcOel0A:10
 a=6IFa9wvqVegA:10 a=VwQbUJbxAAAA:8 a=cm27Pg_UAAAA:8 a=EUspDBNiAAAA:8
 a=6v-l1fwnC9SIymP-7WkA:9 a=CjuIK1q_8ugA:10 a=bTQJ7kPSJx9SKPbeHEYW:22
X-Proofpoint-ORIG-GUID: 3hGiD4yI9QfS6GSkI_7ZOtLVWxzdLByj
X-Proofpoint-Spam-Details-Enc: AW1haW4tMjUwNjA2MDAzMCBTYWx0ZWRfXy3fownDO1uaj
 mN/CNE3uBvSVYg/KtrOALSqp6lDj4Zk07GY8SzehI789dwpiCoN77Y6xFIBZdEFxgrjrcqYBwjB
 YvERGWs52aXLr7XV89oqCw6PzljvbUbKJMbdMBDAoN+Q+IzowKBKKDG6BGzjx2tWorfPeONghf0
 OnwI3RL9xD3lz6Z7ClT1J0rxoYhfIped9Vhp/n3qrjx49bG+qWyGXoudqR+L7ToYcdqYbLUDYki
 /FFm3R36rejgnF/9iKqkvjEEJUyWgRuDJm+0BMAeCXE2I8XXk1SXC14aM8OaHHCwo/alXW3cjwG
 3bR1X9+ewS7+YjRVtBJg2QqXcsRvOq9goqppgjWs0nJWLQoT2mXNuDkCsAA+C4OFboDAb0z1aXF
 KAhUyjj7xd7hzMigChkjpcU5Y+GSKIN+GYxs0USf1YTzieEq4iloUmfcjDGNUEx88ohYuuJV
X-Proofpoint-GUID: 3hGiD4yI9QfS6GSkI_7ZOtLVWxzdLByj
X-Proofpoint-Virus-Version: vendor=baseguard
 engine=ICAP:2.0.293,Aquarius:18.0.1099,Hydra:6.0.736,FMLib:17.12.80.40
 definitions=2025-06-06_01,2025-06-05_01,2025-03-28_01
X-Proofpoint-Spam-Details: rule=outbound_notspam policy=outbound score=0
 priorityscore=1501 mlxscore=0 adultscore=0 bulkscore=0 suspectscore=0
 malwarescore=0 clxscore=1015 lowpriorityscore=0 spamscore=0 impostorscore=0
 phishscore=0 mlxlogscore=999 classifier=spam authscore=0 authtc=n/a authcc=
 route=outbound adjust=0 reason=mlx scancount=1 engine=8.19.0-2505280000
 definitions=main-2506060030

On Thu, Jun 05, 2025 at 02:29:53PM -0500, Bjorn Andersson wrote:
> On Thu, Jun 05, 2025 at 06:57:41PM +0300, Dmitry Baryshkov wrote:
> > On Thu, Jun 05, 2025 at 08:43:00AM -0500, Bjorn Andersson wrote:
> > > When the MDT loader is used in remoteproc, the ELF header is sanitized
> > > beforehand, but that's not necessary the case for other clients.
> > > 
> > > Validate the size of the firmware buffer to ensure that we don't read
> > > past the end as we iterate over the header.
> > > 
> > > Fixes: 2aad40d911ee ("remoteproc: Move qcom_mdt_loader into drivers/soc/qcom")
> > > Cc: <stable@vger.kernel.org>
> > > Reported-by: Doug Anderson <dianders@chromium.org>
> > > Signed-off-by: Bjorn Andersson <bjorn.andersson@oss.qualcomm.com>
> > > ---
> > >  drivers/soc/qcom/mdt_loader.c | 37 +++++++++++++++++++++++++++++++++++++
> > >  1 file changed, 37 insertions(+)
> > > 
> > > diff --git a/drivers/soc/qcom/mdt_loader.c b/drivers/soc/qcom/mdt_loader.c
> > > index b2c0fb55d4ae678ee333f0d6b8b586de319f53b1..1da22b23d19d28678ec78cccdf8c328b50d3ffda 100644
> > > --- a/drivers/soc/qcom/mdt_loader.c
> > > +++ b/drivers/soc/qcom/mdt_loader.c
> > > @@ -18,6 +18,31 @@
> > >  #include <linux/slab.h>
> > >  #include <linux/soc/qcom/mdt_loader.h>
> > >  
> > > +static bool mdt_header_valid(const struct firmware *fw)
> > > +{
> > > +	const struct elf32_hdr *ehdr;
> > > +	size_t phend;
> > > +	size_t shend;
> > > +
> > > +	if (fw->size < sizeof(*ehdr))
> > > +		return false;
> > > +
> > > +	ehdr = (struct elf32_hdr *)fw->data;
> > > +
> > > +	if (memcmp(ehdr->e_ident, ELFMAG, SELFMAG))
> > > +		return false;
> > > +
> > > +	phend = size_add(size_mul(sizeof(struct elf32_phdr), ehdr->e_phnum), ehdr->e_phoff);
> > 
> > Nit, this should be a max(sizeof() and ehdr->e_phentsize.
> > 
> 
> Hmm, I forgot about e_phentsize.
> 
> But the fact is that the check matches what we do below and validates
> that we won't reach outside the provided buffer.
> If e_phentsize != sizeof(struct elf32_phdr) we're not going to be able
> to parse the header.
> 
> Not sure if it's worth it, but that would make sense to change
> separately. In which case ehdr->e_phentsize * ehdr->e_phnum would be the
> correct thing to check (no max()). Or perhaps just a check to ensure
> that e_phentsize == sizeof(struct elf32_phdr)?

I think it's the best option.

-- 
With best wishes
Dmitry

